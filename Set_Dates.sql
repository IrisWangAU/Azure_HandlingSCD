-- FOR `InsertedDate`
iif(isNull(InsertedDate), currentTimestamp(), {InsertedDate})

-- FOR `ModifiedDate`
currentTimestamp()