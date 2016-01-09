<div id="header-menu">
<div class="material-load-bar">
      <div class="material-bar"></div>
      <div class="material-bar"></div>
      <div class="material-bar"></div>
    </div>
<header id="header" component="navbar">
    <ul class="header-inner">
        
    	<li class="logo <!-- IF config.menuInHeader -->menu-in-header<!-- ENDIF config.menuInHeader -->">
			<!-- IF brand:logo -->
            <a href="#">
                <img alt="{brand:logo:alt}" class="{brand:logo:display} forum-logo click_back" src="{brand:logo}" />
            </a>
            <!-- ENDIF brand:logo -->

            <!-- IF config.showSiteTitle -->
			<a class="title" href="{relative_path}/">
				{title}
			</a>
			<!-- ENDIF config.showSiteTitle -->
        </li>

        <!-- IF config.menuInHeader -->
        <li class="hidden-xs">
            <ul class="header-menu"> 
                <!-- BEGIN navigation -->
                <!-- IF function.displayMenuItem, @index -->
                <li class="{navigation.class}">
                    <a href="{relative_path}{navigation.route}" title="{navigation.title}" id="{navigation.id}"<!-- IF navigation.properties.targetBlank --> target="_blank"<!-- ENDIF navigation.properties.targetBlank -->>
                        <!-- IF navigation.iconClass -->
                        <i class="fa fa-fw {navigation.iconClass}"></i>
                        <!-- ENDIF navigation.iconClass -->
                    </a>
                </li>
                <!-- ENDIF function.displayMenuItem -->
                <!-- END navigation -->
            </ul>
        </li>
        <!-- ENDIF config.menuInHeader -->

        <li class="pull-right">
        <ul class="top-menu">
            <li class="nav navbar-nav pagination-block invisible visible-lg visible-md">
                <div class="dropdown">
                    <i class="fa fa-angle-double-up pointer fa-fw pagetop"></i>
                    <i class="fa fa-angle-up pointer fa-fw pageup"></i>

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="pagination-text"></span>
                    </a>

                    <i class="fa fa-angle-down pointer fa-fw pagedown"></i>
                    <i class="fa fa-angle-double-down pointer fa-fw pagebottom"></i>

                    <div class="progress-container">
                        <div class="progress-bar"></div>
                    </div>

                    <ul class="dropdown-menu" role="menu">
                        <input type="text" class="form-control" id="indexInput" placeholder="[[global:pagination.enter_index]]">
                    </ul>
                </div>
            </li>
			<li >
               <a href="#" class='click_back' style="float:right;text-align: right;color: #fff;width: 92px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;cursor: pointer;">
					返回主页
				</a>
            </li>
            <li>
                <a href="#" id="reconnect" class="hide" title="Connection to {title} has been lost, attempting to reconnect...">
                    <i class="fa fa-check"></i>
                </a>
            </li>
            <!-- IF config.searchEnabled -->
            <li>
                <form id="search-form" class="hidden-xs" role="search" method="GET" action="">
                    <div class="hidden" id="search-fields">
                        <div class="form-group">
                            <div class="fg-line">
                                <input type="text" class="form-control" placeholder="[[global:search]]" name="query" value="">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default hide">[[global:search]]</button>
                    </div>
                    <button id="search-button" type="button" class="btn btn-link"><i class="fa fa-search fa-fw" title="[[global:header.search]]"></i></button>
                </form>
            </li>
            <!-- ENDIF config.searchEnabled -->
			
			<!-- IF config.loggedIn -->
           
            <li id="user_label" class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="user_dropdown">
                    <!-- IF user.picture -->
                    <img component="header/userpicture" src="{user.picture}" alt="{user.username}" class="user-picture" id="user-header-picture" />
                    <!-- ELSE -->
                   {user.username}
                    <!-- ENDIF user.picture -->
                </a>
              
            </li>
            <!-- ELSE -->
            <!-- IF allowRegistration -->
            <li class="hidden-xs">
                <a href="{relative_path}/register">
					<span>[[global:register]]</span>
				</a>
            </li>
            <!-- ENDIF allowRegistration -->
            <li class="hidden-xs">
            	<a href="{relative_path}/login">
					<span>[[global:login]]</span>
				</a>
            </li>
            <!-- ENDIF config.loggedIn -->
            </ul>
        </li>
    </ul>
    
</header>
</div>
<section id="main" class="<!-- IF menuInHeader -->visible-xs<!-- ENDIF menuInHeader -->">
    <aside id="sidebar">
        <div class="sidebar-inner">
            <div class="si-inner">
                <ul class="main-menu">
                    <li id="toggle-width" class="hidden-xs">
                        <div class="toggle-switch">
                            <input id="tw-switch" type="checkbox" hidden="hidden">
                            <label for="tw-switch" class="ts-helper"></label>
                        </div>
                    </li>
                    <!-- IF !config.loggedIn -->  
                    <!-- IF allowRegistration -->
                    <li class="visible-xs">
                        <a href="{relative_path}/register">
                            <i class="fa fa-pencil fa-fw"></i> [[global:register]]
                        </a>
                    </li>
                    <!-- ENDIF allowRegistration -->
                    <li class="visible-xs">
                        <a href="{relative_path}/login">
                            <i class="fa fa-sign-in fa-fw"></i> [[global:login]]
                        </a>
                    </li>
                    <!-- ENDIF !config.loggedIn -->

                    <li class="visible-xs">
                        <a href="{relative_path}/search">
                            <i class="fa fa-search fa-fw"></i> [[global:search]]
                        </a>
                    </li>

					<!-- BEGIN navigation -->
					<!-- IF function.displayMenuItem, @index -->
					<li class="{navigation.class}">
						<a href="{relative_path}{navigation.route}" title="{navigation.title}" id="{navigation.id}" target="{navigation.properties.target}">
							<!-- IF navigation.iconClass -->
							<i class="fa fa-fw {navigation.iconClass}"></i>
							<!-- ENDIF navigation.iconClass -->
							<!-- IF navigation.text -->
							{navigation.text}
							<!-- ENDIF navigation.text -->
						</a>
					</li>
					<!-- ENDIF function.displayMenuItem -->
					<!-- END navigation -->
                </ul>
            </div>
        </div>
    </aside>
</section>