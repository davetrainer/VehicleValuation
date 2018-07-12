using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Threading;
using VehicleValuation.Services.DomainObjects;
using VehicleValuation.Services.Services;

namespace VehicleValuation.Services.IntegrationTests
{
    [TestClass]
    public class VehicleValuationServiceTests
    {

        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties

        #endregion

        #region Methods

        private VehicleValuationRequest GetVehicleValuationRequest()
        {
            return new VehicleValuationRequest()
            {
                VehicleRegistration = "TESTVAL",
                Mileage = 100000,
                CustomerName = "TESTVAL",
                CustomerEmail = "TESTVAL",
                TelephoneNumbers = new[] { "111111", "222222" }

            };
        }

        [TestMethod]
        public void TestThatWhenAValidRequestIsMadeThenAValidResponseIsReturned()
        {
            var valuationRequest = GetVehicleValuationRequest();

            var valuationService = new VehicleValuationService();

            var valuationResponse = valuationService.GetVehicleValuation(valuationRequest);

            Assert.IsNotNull(valuationResponse);
        }

        [TestMethod]
        public void TestThatWhenAnInValidRequestIsMadeThenAnEmptyResponseIsReturned()
        {
            var valuationService = new VehicleValuationService();

            var valuationResponse = valuationService.GetVehicleValuation(null);

            Assert.IsNotNull(valuationResponse);
            Assert.IsNull(valuationResponse.ValuationDate);
            Assert.IsNull(valuationResponse.ExpiryDate);
            Assert.IsNull(valuationResponse.GuidePrice);
        }

        [TestMethod]
        public void TestThatWhenAValidRequestIsMadeThenTheExpiryDateIsSevenDaysFromValuationDate()
        {
            var valuationRequest = GetVehicleValuationRequest();

            var valuationService = new VehicleValuationService();

            var valuationResponse = valuationService.GetVehicleValuation(valuationRequest);

            Assert.IsNotNull(valuationResponse);
            Assert.AreEqual(valuationResponse.ValuationDate.Value.AddDays(7).Date, valuationResponse.ExpiryDate.Value.Date);
        }

        [TestMethod]
        public void TestThatValuationServiceGeneratesARandomPrice()
        {
            var valuationRequest = GetVehicleValuationRequest();

            var valuationService = new VehicleValuationService();

            var valuationResponse = valuationService.GetVehicleValuation(valuationRequest);

            Thread.Sleep(100);

            var newValuationResponse = valuationService.GetVehicleValuation(valuationRequest);

            Assert.AreNotEqual(valuationResponse.GuidePrice, newValuationResponse.GuidePrice);
        }

        #endregion
    }
}
