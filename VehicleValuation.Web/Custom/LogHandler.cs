using System;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace VehicleValuation.Web.Custom
{
    public class LogHandler : DelegatingHandler
    {
        protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            var logData = BuildRequestLog(request);
            var response = await base.SendAsync(request, cancellationToken);
            logData = BuildResponseLog(logData, response);
            await Log(logData);
            return response;
        }
        private LogData BuildRequestLog(HttpRequestMessage request)
        {
            LogData log = new LogData
            {
                RequestMethod = request.Method.Method,
                RequestTimestamp = DateTime.Now,
                RequestUri = request.RequestUri.ToString()
            };
            return log;
        }
        private LogData BuildResponseLog(LogData logData, HttpResponseMessage response)
        {
            logData.ResponseStatusCode = response.StatusCode;
            logData.ResponseTimestamp = DateTime.Now;
            logData.ResponseContentType = response.Content.Headers.ContentType.MediaType;
            return logData;
        }
        private async Task<bool> Log(LogData logData)
        {
            // Log data here to DB or other logging destination.
            return true;
        }
    }
}