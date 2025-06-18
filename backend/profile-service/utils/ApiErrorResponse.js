// This file stays exactly the same. It's our blueprint for an error object.
class ApiErrorResponse extends Error {
    constructor(statusCode, message, path) {
        super(message);
        this.timestamp = new Date().toISOString();
        this.status = statusCode;
        this.error = this.getHttpStatusText(statusCode);
        this.message = message;
        this.path = path;
    }

    getHttpStatusText(code) {
        const statusMap = {
            404: 'Not Found',
            500: 'Internal Server Error'
        };
        return statusMap[code] || 'Error';
    }
    toJSON() {
    return {
      timestamp: this.timestamp,
      status: this.status,
      error: this.error,
      message: this.message,
      path: this.path,
    };
  }
}

module.exports = { ApiErrorResponse };