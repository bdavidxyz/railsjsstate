class GetCurrentPath

  def initialize(req)
    @req = req
  end

  def call

    # Stolen from http://hackingoff.com/blog/generate-rails-sitemap-from-routes/
    routes = Rails.application.routes.routes.map do |route|
      {
        alias: route.name,
        path: route.path.spec.to_s,
        controller: route.defaults[:controller],
        action: route.defaults[:action]
      }
    end

    current = Rails.application.routes.recognize_path(@req.env['PATH_INFO'])

    choice = routes.find do |route|
      route[:controller] == current[:controller] && route[:action] == current[:action]
    end

    choice[:alias] + "_path"
  end

end
