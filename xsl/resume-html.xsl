<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:cv="http://www.giovaresco.fr/resume"
	exclude-result-prefixes="cv #default"
	>

	<xsl:output method="xml" 
     	encoding="UTF-8"
		indent="yes" 
		omit-xml-declaration="yes"/>

	<xsl:template match="/">
		<div class="row">
			<xsl:apply-templates select="cv:resume/cv:personal"/>
		</div>
		<div class="row">
			<xsl:apply-templates select="cv:resume/cv:educations"/>
			<xsl:apply-templates select="cv:resume/cv:trainings"/>
		</div>
			<xsl:apply-templates select="cv:resume/cv:experiences"/>
		<div class="row">
			<xsl:apply-templates select="cv:resume/cv:skills"/>
			<xsl:apply-templates select="cv:resume/cv:languages"/>
			<xsl:apply-templates select="cv:resume/cv:hobbies"/>
		</div>
	</xsl:template>
	
	<!-- START Personnal -->
	<xsl:template match="cv:personal">
		<xsl:variable name="address1" select="cv:address/cv:street" />
		<xsl:variable name="address2">
			<xsl:value-of select="cv:address/cv:zipcode"/>&#160;<xsl:value-of select="cv:address/cv:city"/>
		</xsl:variable>
		<xsl:variable name="email" select="cv:email_www" />
		<xsl:variable name="mobile" select="cv:mobile" />
		<!--<xsl:variable name="comment" select="cv:comment" />-->

		<section class="col-md-4">
			<h2 class="my-caption">Informations personnelles</h2>

			<address class="my-info">
				Adresse
				<span><xsl:value-of select="$address1"/></span> <br/>
				<span><xsl:value-of select="$address2"/></span> <br/>
			</address>
		</section>

		<section class="col-md-4">
			<h2 class="my-caption">Contact</h2>

			<p class="my-info">
				<i class="fa fa-phone fa-1g">&#xA0;</i>Mobile
				<span><xsl:value-of select="$mobile"/></span>
			</p>

			<p class="my-info">
				<i class="fa fa-envelope fa-1g">&#xA0;</i>Email
				<span><a href="mailto:{$email}"><xsl:value-of select="$email" /> </a></span>
			</p>
		</section>

		<section id="follow" class="col-md-4">
			<h2 class="my-caption">Me suivre</h2>

			<xsl:apply-templates select="cv:webAddress"/>
		</section>
	</xsl:template>
	<xsl:template match="cv:webAddress">
		<xsl:for-each select="cv:www">
			<p class="my-info">
				<xsl:choose>
					<xsl:when test="@type = 'homepage'">
						<i class="fa fa-globe fa-lg">&#xA0;</i>
					</xsl:when>
					<xsl:otherwise>
						<i class="fa fa-{@type} fa-lg">&#xA0;</i>
					</xsl:otherwise>
				</xsl:choose>
				<span><a href="http://{@url}"><xsl:value-of select="@name"/></a></span>
			</p>
		</xsl:for-each>
	</xsl:template>
	<!-- END Personnal -->
	
	<!-- START Educations -->
	<xsl:template match="cv:educations">
		<section id="education" class="col-md-6">
			<h2 class="my-caption">Etudes</h2>
		<xsl:for-each select="cv:education">
			<xsl:variable name="year" select="cv:year" />
			<xsl:variable name="certificate" select="cv:certificate" />
			<xsl:variable name="speciality" select="cv:speciality" />
			<xsl:variable name="school_name" select="cv:school/cv:title" />
			<xsl:variable name="school_www" select="cv:school/cv:www" />
			
			<article>
				<h3 class="my-caption"><xsl:value-of select="$year"/> - <xsl:value-of select="$certificate"/></h3>
				<xsl:if test="$speciality != ''">
				<p class="speciality">
					<xsl:value-of select="$speciality"/>
				</p>
				</xsl:if>
				<p class="place">
					<a href="http://{$school_www}"><xsl:value-of select="$school_name"/></a>
				</p>
			</article>
		</xsl:for-each>
		</section>
	</xsl:template>
	<!-- END Educations -->
	
	<!-- START Trainings -->
	<xsl:template match="cv:trainings">
		<section id="trainings" class="col-md-6">
			<h2 class="my-caption">Formations et Certifications</h2>
		<xsl:for-each select="cv:training">
			<xsl:variable name="year" select="cv:year" />
			<xsl:variable name="title" select="cv:title" />
			<xsl:variable name="organization_name" select="cv:organization/cv:title" />
			<xsl:variable name="organization_www" select="cv:organization/cv:www" />
			<article>
				<h3 class="my-caption"><xsl:value-of select="$year"/> - <xsl:value-of select="$title"/></h3>
				<xsl:if test="$organization_name != ''">
					<p class="place">
						<a href="http://{$organization_www}"><xsl:value-of select="$organization_name"/></a>
					</p>
				</xsl:if>
			</article>
		</xsl:for-each>
		</section>
	</xsl:template>
	<!-- END Trainings -->
	
	<!-- START Experiences -->
	<xsl:template match="cv:experiences">
		<section id="experiences">
			<h2 class="my-caption">Expériences professionelles</h2>
		<xsl:for-each select="cv:experience">
			<xsl:variable name="year" select="cv:year" />
			<xsl:variable name="title" select="cv:title" />
			<xsl:variable name="company_name" select="cv:company/cv:title" />
			<xsl:variable name="company_www" select="cv:company/cv:www" />
			<xsl:variable name="mission_number"  select="count(cv:missions/cv:mission)" />

			<article>
				<h3 class="my-caption"><xsl:value-of select="$year"/> - <xsl:value-of select="$title"/></h3>
				<p class="place">
					<a href="http://{$company_www}/"><xsl:value-of select="$company_name"/></a>
				</p>

            <xsl:choose>
                <xsl:when test="$mission_number = 1">
                    <xsl:variable name="mission_title" select="cv:missions/cv:mission/cv:title" />
                    <xsl:variable name="responsibility" select="cv:missions/cv:mission/cv:responsibility" />
                    <xsl:variable name="competences" select="cv:missions/cv:mission/cv:competences" />
                    <div class="mission">
                        <xsl:value-of select="$mission_title"/>
                        <aside>
                            <xsl:if test="$responsibility != ''">
                                <p>
                                    Responsabilités : <xsl:value-of select="$responsibility"/>
                                </p>
                            </xsl:if>
                            <p>
                                Technologies : <xsl:value-of select="$competences"/>
                            </p>
                        </aside>
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="cv:missions/cv:mission">
                        <xsl:variable name="mission_title" select="cv:title" />
                        <xsl:variable name="responsibility" select="cv:responsibility" />
                        <xsl:variable name="competences" select="cv:competences" />
                        <div class="mission">
                            <h4 class="my-caption"><xsl:value-of select="$mission_title"/></h4>

                            <xsl:apply-templates select="cv:detail"/>

                            <aside>
                                <xsl:if test="$responsibility != ''">
                                <p>
                                Responsabilités : <xsl:value-of select="$responsibility"/>
                                </p>
                                </xsl:if>
                                <p>
                                Technologies : <xsl:value-of select="$competences"/>
                                </p>
                            </aside>
                        </div>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
			</article>
		</xsl:for-each>
		</section>
	</xsl:template>
	<xsl:template match="cv:detail">
		<div class="detail">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- override rule: <newline> nodes get special treatment -->
	<xsl:template match="cv:detail//cv:newline">
		<br />
	</xsl:template>
	<xsl:template match="cv:detail//cv:list">
		<ul>
			<xsl:apply-templates />
		</ul>
	</xsl:template>
	<xsl:template match="cv:detail//cv:list//cv:item">
		<li>
			<xsl:apply-templates />
		</li>
	</xsl:template>
	<!-- override rule: copy any text node beneath description -->
	<xsl:template match="cv:detail//text()">
		<xsl:copy-of select="." />
	</xsl:template>
	<!-- END Experiences -->
		
	<!-- START Skills -->
	<xsl:template match="cv:skills">
		<section id="skills" class="col-md-6">
			<h2 class="my-caption">Compétences acquises</h2>
		<xsl:for-each select="cv:skill">
			<xsl:variable name="type" select="cv:type" />
			<article>
				<h3 class="my-caption"><xsl:value-of select="$type"/></h3>
			<xsl:for-each select="cv:value">
				<p>
				<xsl:value-of select="."/>
				</p>
			</xsl:for-each>
			</article>
		</xsl:for-each>
		</section>
	</xsl:template>
	<!-- END Skills -->
		
	<!-- START Languages -->
	<xsl:template match="cv:languages">
		<section id="languages" class="col-md-6">
			<h2 class="my-caption">Langues</h2>
			<ul class="list-unstyled">
			<xsl:for-each select="cv:language">
				<xsl:variable name="name" select="cv:name" />	
				<xsl:variable name="level" select="cv:level" />	
				<li>
					<span><xsl:value-of select="$name"/> : </span><xsl:value-of select="$level"/>
				</li>
			</xsl:for-each>
			</ul>
		</section>
	</xsl:template>
	<!-- END Languages -->
		
	<!-- START Hobbies -->
	<xsl:template match="cv:hobbies">
		<section id="hobbies" class="col-md-6">
			<h2 class="my-caption">Loisirs</h2>
			<ul class="list-unstyled">
			<xsl:for-each select="cv:hobby">
				<li><xsl:value-of select="."/></li>
			</xsl:for-each>
			</ul>
		</section>
	</xsl:template>
	<!-- END Hobbies -->
	
	
</xsl:stylesheet>