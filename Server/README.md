Frood Server (Node.js)
----------------------

## Photos
### /api/media/photos/upload
You can upload png, gif, and jpg files.
```
{
  path: /path/to/image/file.ext
}
```

## Events
### /api/events
#### GET
```
{
  _id: 56b561b3f0d3303239000001,
  name: "Event Name",
  description: "Event Description",
  location: "Event Location",
  host: "Event Host",
  start: new Date("2016-02-06T19:00:00.000Z"),
  end: new Date("2016-02-06T19:00:00.000Z"),
  reports: 0,
  hearts: 0,
  tags: [
    "Tag1",
    "Tag2"
  ]
}
```
