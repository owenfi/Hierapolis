#!/bin/bash

# A smaller script to chop our normalized into various sub-table info

# Definition of a line: (Space delimited)
# RequestId BucketOwner BucketName Time RemoteIP Requester Operation Key "URI" HTTPStatus ErrorCode BytesSent ObjectSize TotalTime TurnaroundTime "Referrer" "User-Agent" VersionId

# Regex to grab just the Remote IP Address:
# sed 's/.* .* .* .* \(.*\) .* .* .* ".*" .* .* .* .* .* .* ".*" ".*" .*/\1/g'

# Regex for: IP,Date,Object Name,Bytes Transferred,Total Bytes,ReqID
sed 's/\(.*\) .* .* \(.*\) \(.*\) .* .* \(.*\) ".*" .* .* \(.*\) \(.*\) .* .* ".*" ".*" .*/\3,\2,\4,\5,\6,\1/g' |

# Prints only the reqID
# sed 's/\(.*\) .* .* \(.*\) \(.*\) .* .* \(.*\) ".*" .* .* \(.*\) \(.*\) .* .* ".*" ".*" .*/\1/g' |

# Comment this if it's really slow?
sort
