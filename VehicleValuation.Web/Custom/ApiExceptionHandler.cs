using System.Net;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.ExceptionHandling;

namespace VehicleValuation.Web.Custom
{
    /// <summary>
    /// Unhandled exceptions.
    /// </summary>
    public class ApiExceptionHandler : ExceptionHandler
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

        public async override Task HandleAsync(ExceptionHandlerContext context, CancellationToken cancellationToken)
        {
            string errorMessage = string.Format("Exception: Unhandled exception, Message: {0}, Stack Trace: {1}",
                context.Exception.Message, context.Exception.StackTrace);

            //log error from here...

            var errorResponse = new[] { "An Error Has Occurred" };

            context.Result = new ExceptionResponseResult()
            {
                StatusCode = HttpStatusCode.InternalServerError,
                ExceptionResponseObject = errorResponse,
                Request = context.Request
            };

            await base.HandleAsync(context, cancellationToken);
        }

        public override bool ShouldHandle(ExceptionHandlerContext context)
        {
            return true;
        }

        #endregion
    }
}