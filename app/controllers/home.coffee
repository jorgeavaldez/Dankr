express  = require 'express'
router = express.Router()
mongoose = require 'mongoose'
Post  = mongoose.model 'Post'

module.exports = (app) ->
  app.use '/', router

# Shows the post feed
router.get '/postlist', (req, res, next) ->

    Post.find (err, posts) ->
        return next(err) if err
        res.render 'posts',
            title: 'Dankr'
            postlist: posts

# Shows the new post page
router.get '/newpost', (req, res, next) ->
    res.render 'postForm'

# This is where the actual posting happens.
# This gets called when the user presses the 'post' button.
router.post '/addpost', (req, res, next) ->

    # We get the values from the form.
    # The names rely on what we named the fields in postForm.
    postTitle = req.body.postTitle
    postText = req.body.postText

    # Make a Post object
    post = new Post(
        title: postTitle
        text: postText)

    # Save the Post object to the db
    post.save (err, newpost) ->
        return next(err) if err

        # Take us back to the initial home page
        res.location '/postlist'
        res.redirect '/postlist'
