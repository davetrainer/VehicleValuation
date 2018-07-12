using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using VehicleValuation.Services.Interfaces;
using VehicleValuation.Services.Services;
using VehicleValuation.Web.Custom;
using VehicleValuation.Web.Models;

namespace VehicleValuation.Web.WebAPIControllers
{
    [AccessAuthorise]
    public class VehicleValuationController : ApiController
    {

        #region Constants

        #endregion

        #region Constructors

        public VehicleValuationController(IVehicleValuationService valuationService)
        {
            _valuationService = valuationService;
        }

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties

        private readonly IVehicleValuationService _valuationService;

        #endregion

        #region Methods

        public IHttpActionResult Post(VehicleValuationRequestModel model)
        {
            if (ModelState.IsValid)
            {
                var request = new Services.DomainObjects.VehicleValuationRequest()
                {
                    VehicleRegistration = model.VehicleRegistration,
                    Mileage = model.Mileage.Value,
                    CustomerName = model.CustomerName,
                    CustomerEmail = model.CustomerEmail,
                    TelephoneNumbers = model.TelephoneNumbers
                };

                var serviceResponse = _valuationService.GetVehicleValuation(request);

                if (serviceResponse.ValuationDate.HasValue)
                {
                    var response = new VehicleValuationResponseModel()
                    {
                        ValuationDate = serviceResponse.ValuationDate.Value,
                        ExpiryDate = serviceResponse.ExpiryDate.Value,
                        GuidePrice = serviceResponse.GuidePrice.Value.ToString()
                    };

                    return Ok(response);
                }
                else
                {
                    return BadRequest("Unable to generation valuation");
                }
            }
            else
            {
                return BadRequest(this.ModelState);
            }
        }

        #endregion
    }
}
