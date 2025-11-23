# Radicale CalDAV demo server
FROM python:3.12-slim

# Install Radicale and bcrypt for password hashing
RUN pip install --no-cache-dir radicale bcrypt passlib

WORKDIR /app

# Copy configuration
COPY radicale.conf /etc/radicale/config
COPY rights /etc/radicale/rights

# Generate password file (demo:demo123)
RUN python -c "from passlib.hash import bcrypt; print('demo:' + bcrypt.hash('demo123'))" > /etc/radicale/users

# Copy pre-populated demo data
COPY collections/ /var/lib/radicale/collections/

# Railway provides PORT environment variable
ENV PORT=8080

EXPOSE ${PORT}

# Run Radicale
CMD radicale --hosts 0.0.0.0:${PORT}
