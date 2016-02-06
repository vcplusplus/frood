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
[
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
  {
    _id: 56b561b3f0d3303239000001,
    name: "Event Name",
    description: "Event Description",
    ...
  }
]
```

#### POST
Post must include `name`, `description`, `location`, `host`, `start`, `end`, `tags`. On success:
```
{
  id: 56b603b927639a1a03000001,
  message: "Created!"
}
```
On failure:
```
{ message: "Error! You did not include all the required info." }
```

### /api/event/56b603b927639a1a03000001

#### GET
Gets the json object for the event
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

#### PUT
Update the event. Only updates with the fields you include (ie. an empty PUT
request will return an object with no changes)
```
{ message: "Updatedd!" }
```

#### DELETE
Removes the event with the given id
```
{ message: "Deleted!" }
```

### /api/event/56b603b927639a1a03000001/report
#### PUT
Increments the report count by 1
```
{ message: "Reported!"}
```

### /api/event/56b603b927639a1a03000001/heart
#### PUT
Increments the heart count by 1
```
{ message: "Hearted!"}
```

#### DELETE
Decrements the heart count by 1 if the heart count is greater than 0
```
{ message: "Unhearted!"}
```
