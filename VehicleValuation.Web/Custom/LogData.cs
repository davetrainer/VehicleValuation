using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace VehicleValuation.Web.Custom
{
    public class LogData
    {

        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties

        public string RequestContentType { get; set; }
        public string RequestUri { get; set; }
        public string RequestMethod { get; set; }
        public DateTime? RequestTimestamp { get; set; }
        public string ResponseContentType { get; set; }
        public HttpStatusCode ResponseStatusCode { get; set; }
        public DateTime? ResponseTimestamp { get; set; }

        #endregion

        #region Methods

        #endregion  
    }
}