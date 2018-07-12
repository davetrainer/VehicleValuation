using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace VehicleValuation.Web.Models
{
    public class VehicleValuationRequestModel
    {

        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties

        [Required]
        public string VehicleRegistration { get; set; }
        [Required]
        public int? Mileage { get; set; }
        [Required]
        public string CustomerName { get; set; }
        [Required]
        public string CustomerEmail { get; set; }
        [Required]
        public IEnumerable<string> TelephoneNumbers { get; set; }
        #endregion

        #region Methods

        #endregion
    }
}