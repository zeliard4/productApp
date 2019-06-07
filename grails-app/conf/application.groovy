

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'productApp.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'productApp.UserRole'
grails.plugin.springsecurity.authority.className = 'productApp.Role'
grails.plugin.springsecurity.auth.loginFormUrl = '/auth/login'
grails.plugin.springsecurity.successHandler.defaultTargetUrlForUser = '/user/index'
grails.plugin.springsecurity.successHandler.defaultTargetUrlForAdmin = '/admin/index'
grails.plugin.springsecurity.failureHandler.defaultFailureUrl = '/auth/login?fail=true'


grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/adminadmin.gsp',      access: ['ROLE_ADMIN']],
	[pattern: '/index.gsp',       access: ['ROLE_ADMIN',['ROLE_USER']]],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

