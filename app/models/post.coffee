mongoose = require 'mongoose'
Schema   = mongoose.Schema

PostSchema = new Schema(
  title: String
  text: String
)

# Virtuals are not actually persisted in the database.
# They are generated on the fly.
PostSchema.virtual('date')
  .get (-> this._id.getTimestamp())

mongoose.model 'Post', PostSchema
