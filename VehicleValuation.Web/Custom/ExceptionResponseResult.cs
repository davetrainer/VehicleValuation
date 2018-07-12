using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;

namespace VehicleValuation.Web.Custom
{
    public class ExceptionResponseResult : IHttpActionResult
    {

        #region Constants

        #endregion

        #region Constructors

        #endregion

        #region Events & Delegates

        #endregion

        #region Properties

        public HttpStatusCode StatusCode { get; set; }
        public object ExceptionResponseObject { get; set; }
        public HttpRequestMessage Request { get; set; }

        #endregion

        #region Methods
        public Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
        {
            var response = new HttpResponseMessage(StatusCode);
            response.RequestMessage = Request;
            response.Content = new JsonContent(ExceptionResponseObject);
            return Task.FromResult(response);
        }

        #endregion
    }
}