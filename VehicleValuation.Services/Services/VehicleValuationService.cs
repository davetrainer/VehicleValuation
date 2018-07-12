using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VehicleValuation.Services.DomainObjects;
using VehicleValuation.Services.Interfaces;

namespace VehicleValuation.Services.Services
{
    public class VehicleValuationService : IVehicleValuationService
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

        public VehicleValuationResponse GetVehicleValuation(VehicleValuationRequest request)
        {
            if (request != null)
            {
                var response = new VehicleValuationResponse()
                {
                    ValuationDate = DateTime.Now,
                    ExpiryDate = DateTime.Now.AddDays(7),
                    GuidePrice = new Random().Next(1, 10000)
                };

                //Encrypt PII here. These can then be stored in the DB.
                var salt = EncryptionService.GetSalt();

                var nameEncrypted = EncryptionService.Encrypt(request.CustomerName, salt);

                var telephoneNumbers = string.Join(",", request.TelephoneNumbers);

                var telephoneNumbersEncrpted = EncryptionService.Encrypt(telephoneNumbers, salt);

                return response;
            }
            else
            {
                return new VehicleValuationResponse();
            }
        }

        #endregion
    }
}
