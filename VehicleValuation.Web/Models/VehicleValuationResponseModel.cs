using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace VehicleValuation.Web.Models
{
    public class VehicleValuationResponseModel
    {

        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties
        public DateTime ValuationDate { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string GuidePrice { get; set; }
        #endregion

        #region Methods

        #endregion
    }
}