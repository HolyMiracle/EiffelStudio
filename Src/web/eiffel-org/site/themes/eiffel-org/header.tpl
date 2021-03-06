						<div class="container header-holder">
							<strong class="logo"><a href="{$site_url/}"><img src="{$theme_path/}images/logo.png" width="226" height="60" alt="Eiffel"></a></strong>
							<nav id="nav">
								<ul>
									<li><a href="{$site_url/}welcome">welcome</a></li>
									<li><a href="{$site_url/}documentation">documentation</a></li>
									<li><a href="{$site_url/}resources">resources</a></li>
									<li><a href="{$site_url/}contribute">contribute</a></li>
									<li><a href="{$site_url/}blogs">blogs</a></li>
									<li><a href="{$site_url/}downloads">download</a></li>
								</ul>
							</nav>
							<div class="header-right">
								<nav class="add-links">
									<ul> 
									{if isempty="$user"}
										<li>
										{unless isempty="$site_sign_in_url"}<a href="{$site_sign_in_url/}">Sign in</a>{/unless}
										{if isempty="$site_sign_in_url"}<a href="{$site_url/}account">Sign in</a>{/if}
										</li>
									{/if}
									{unless isempty="$user"}
										<li><a href="{$site_url/}account">{$user.name/}</a>
											{unless isempty="$site_sign_out_url"}<ul><li><a href="{$site_sign_out_url/}">Sign out</a></li></ul>{/unless}
										</li>
									{/unless}
									</ul>
								</nav>
								{if isset="$page.regions.search"}
								{$page.regions.search/}
								{/if}
							</div>
						</div>
						{assign name="empty" value=""/}
						{unless condition="$page.region_header ~ $empty"}
							<div class="container">
								<div class="promo-area">
									{$page.region_header/}
								</div>	
							</div>
						{/unless}	
						{unless condition="$page.region_jumbotron1 ~ $empty"}
							<div class="container">
								<div class="promo-area">
									{$page.region_jumbotron1/}
									{$page.region_jumbotron2/}
								</div>	
							</div>
						{/unless}	
