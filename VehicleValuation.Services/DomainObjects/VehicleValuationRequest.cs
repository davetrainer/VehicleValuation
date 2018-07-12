using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VehicleValuation.Services.DomainObjects
{
    public class VehicleValuationRequest
    {

        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties
        public string VehicleRegistration { get; set; }
        public int Mileage { get; set; }
        public string CustomerName { get; set; }
        public string CustomerEmail { get; set; }
        public IEnumerable<string> TelephoneNumbers { get; set; }

        #endregion

        #region Methods

        #endregion
    }
}
