# WebTasks Demo CalDAV Server

A pre-configured Radicale CalDAV server for demo and Google Play review purposes.

## Credentials

- **Server URL**: `https://demo.webtasks.org` (or your Railway URL)
- **Username**: `demo`
- **Password**: `demo123`
- **Calendar**: `Demo Tasks`

## Deployment

Deploy to Railway:

1. Create a new Railway project
2. Add this directory as a service
3. Set up a custom domain (optional): `demo.webtasks.org`

## Local Testing

```bash
docker build -t webtasks-demo .
docker run -p 8080:8080 webtasks-demo
```

Then connect WebTasks to `http://localhost:8080` with the demo credentials.

## Notes

- This is a read-write demo server - changes will persist until redeployment
- The demo data resets on each deployment
- For Google Play review, provide these credentials in the app review notes
