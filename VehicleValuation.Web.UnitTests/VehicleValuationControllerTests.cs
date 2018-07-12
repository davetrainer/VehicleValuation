using Microsoft.VisualStudio.TestTools.UnitTesting;
using NSubstitute;
using System;
using System.Web.Http;
using System.Web.Http.Results;
using VehicleValuation.Services.DomainObjects;
using VehicleValuation.Services.Interfaces;
using VehicleValuation.Web.Models;
using VehicleValuation.Web.WebAPIControllers;

namespace VehicleValuation.Web.UnitTests
{
    [TestClass]
    public class VehicleValuationControllerTests
    {

        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties

        private VehicleValuationController _controller;
        private IVehicleValuationService _valuationService;

        #endregion

        #region Methods

        private VehicleValuationRequestModel GetGoodRequestModel()
        {
            return  new VehicleValuationRequestModel()
            {
                VehicleRegistration = "AB12ERT",
                Mileage = 10000,
                CustomerEmail = "test@test.com",
                CustomerName = "test",
                TelephoneNumbers = new[] { "1111111", "2222222" }
            };
        }

        [TestInitialize]
        public void TestInitialise()
        {
            _valuationService = Substitute.For<IVehicleValuationService>();

            _controller = new VehicleValuationController(_valuationService);
            _controller.Configuration = new HttpConfiguration();
        }

        [TestMethod]
        public void WhenValuationRequestedWithValidFieldsThenTheCorrectResponseIsReturned()
        {
            var model = GetGoodRequestModel();

            _controller.Validate(model);

            var valuationResponse = new VehicleValuationResponse()
            {
                ValuationDate = DateTime.Now,
                ExpiryDate = DateTime.Now,
                GuidePrice = 1
            };

            _valuationService.GetVehicleValuation(Arg.Any<VehicleValuationRequest>()).Returns(valuationResponse);

            var result = _controller.Post(model);

            Assert.IsInstanceOfType(result, typeof(OkNegotiatedContentResult<VehicleValuationResponseModel>));
        }

        [TestMethod]
        public void WhenValuationRequestedWithValidFieldsButNoResponseThenTheCorrectResponseIsReturned()
        {
            var model = GetGoodRequestModel();

            _controller.Validate(model);

            _valuationService.GetVehicleValuation(Arg.Any<VehicleValuationRequest>()).Returns(new VehicleValuationResponse());

            var result = _controller.Post(model);

            Assert.IsInstanceOfType(result, typeof(BadRequestErrorMessageResult));
        }

        [TestMethod]
        public void WhenValuationRequestedWithNoMileageThenValidationIsFlagged()
        {
            var model = GetGoodRequestModel();
            model.Mileage = null;

            _controller.Validate(model);

            var result = _controller.Post(model);

            Assert.IsInstanceOfType(result, typeof(InvalidModelStateResult));
            Assert.IsTrue(_controller.ModelState.ContainsKey("Mileage"));
        }

        [TestMethod]
        public void WhenValuationRequestedWithNoVRMThenValidationIsFlagged()
        {
            var model = GetGoodRequestModel();
            model.VehicleRegistration = null;

            _controller.Validate(model);

            var result = _controller.Post(model);

            Assert.IsInstanceOfType(result, typeof(InvalidModelStateResult));
            Assert.IsTrue(_controller.ModelState.ContainsKey("VehicleRegistration"));
        }

        [TestMethod]
        public void WhenValuationRequestedWithNoCustomerNameThenValidationIsFlagged()
        {
            var model = GetGoodRequestModel();
            model.CustomerName = null;

            _controller.Validate(model);

            var result = _controller.Post(model);

            Assert.IsInstanceOfType(result, typeof(InvalidModelStateResult));
            Assert.IsTrue(_controller.ModelState.ContainsKey("CustomerName"));
        }
        [TestMethod]
        public void WhenValuationRequestedWithNoCustomerEmailThenValidationIsFlagged()
        {
            var model = GetGoodRequestModel();
            model.CustomerEmail = null;

            _controller.Validate(model);

            var result = _controller.Post(model);

            Assert.IsInstanceOfType(result, typeof(InvalidModelStateResult));
            Assert.IsTrue(_controller.ModelState.ContainsKey("CustomerEmail"));
        }

        #endregion
    }
}
