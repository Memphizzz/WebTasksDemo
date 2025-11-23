# Radicale CalDAV demo server
FROM python:3.12-slim

# Install Radicale
RUN pip install --no-cache-dir radicale

WORKDIR /app

# Copy configuration
COPY radicale.conf /etc/radicale/config
COPY rights /etc/radicale/rights
COPY users /etc/radicale/users

# Copy pre-populated demo data
COPY collections/ /var/lib/radicale/collections/

# Railway provides PORT environment variable
ENV PORT=8080

EXPOSE ${PORT}

# Run Radicale
CMD radicale --hosts 0.0.0.0:${PORT}
