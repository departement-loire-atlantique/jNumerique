<%@ page contentType="text/html; charset=UTF-8" %><%
%><%@ include file='/jcore/doInitPage.jsp' %><%
%><%@ include file='/jcore/portal/doPortletParams.jsp' %><%


DeploiementCommune obj = (DeploiementCommune)request.getAttribute(PortalManager.PORTAL_PUBLICATION); %><%

%><%@ include file='/front/doFullDisplay.jspf' %>
<%
jcmsContext.addCSSHeader("plugins/CorporateIdentityPlugin/css/types/CollectivityArticle/collectivityArticleFullDisplay.css");
jcmsContext.addCSSHeader("plugins/EServicePlugin/css/types/CollectivityArticle/collectivityArticleFullDisplayEService.css");
%>

<div class="fullDisplay DeploiementCommune collectivity-article-full-display-container eservice">

	<div class="header">
		<div class="menu hidden-phone">
		    <%@include file="/plugins/ToolsPlugin/jsp/headstall/shareNoSeparatorTablet.jspf" %>   
		    <%@include file="/plugins/CorporateIdentityPlugin/jsp/headstall/print.jspf" %>   
		</div>
		<h1><%= obj.getTitle() %><jalios:edit pub="<%= obj %>"/></h1>
	</div>

	<div class="row-fluid">
		<%-- Contenu des infos de déploiement commune --%>	
		<div class="span7 block-spacer">

			<jalios:if predicate='<%= Util.notEmpty(obj.getDescription()) %>'>
				<jalios:wiki><%= obj.getDescription() %></jalios:wiki>
			</jalios:if>
			
			<jalios:if predicate='<%= Util.notEmpty(obj.getCalendrierTravauxWysiwyg()) %>'>
				<h2>Calendrier</h2>
				<jalios:wysiwyg><%= obj.getCalendrierTravauxWysiwyg() %></jalios:wysiwyg>            
			</jalios:if>
			
			<jalios:if predicate='<%= Util.notEmpty(obj.getCalendrierTravauxDocuments()) %>'>
				<%  FileDocument[] docs = obj.getCalendrierTravauxDocuments(); %>
				<%@include file="/plugins/LANumeriquePlugin/jsp/DeploiementCommune/blocTelechargerDocuments.jsp" %>
		    </jalios:if>
			
			<jalios:if predicate='<%= Util.notEmpty(obj.getCartesTravaux()) %>'>
				<h2>Cartes</h2>
				<jalios:wysiwyg><%= obj.getCartesTravaux() %></jalios:wysiwyg>            
			</jalios:if>	
		
			<jalios:if predicate='<%= Util.notEmpty(obj.getCartesTravauxDocuments()) %>'>
				<%  FileDocument[] docs = obj.getCartesTravauxDocuments(); %>
				<%@include file="/plugins/LANumeriquePlugin/jsp/DeploiementCommune/blocTelechargerDocuments.jsp" %>
		    </jalios:if>
		    
		    <jalios:if predicate='<%= Util.notEmpty(obj.getRessourcesUtiles()) %>'>
				<h2>Documents et ressources utiles</h2>
				<jalios:wysiwyg><%= obj.getRessourcesUtiles() %></jalios:wysiwyg>            
			</jalios:if>
			
			<jalios:if predicate='<%= Util.notEmpty(obj.getRessourcesUtilesDocuments()) %>'>
				<%  FileDocument[] docs = obj.getRessourcesUtilesDocuments(); %> 
				<%@include file="/plugins/LANumeriquePlugin/jsp/DeploiementCommune/blocTelechargerDocuments.jsp" %>
		    </jalios:if>
		
		</div>
		
		<%-- Colonne de droite avec mire de connexion/deconnexion + liste des déploiements commune
			(include de la portlet colonne utilisée dans le portail)
		 --%>
		<div class="span4 offset1 block-spacer">
			<jalios:if predicate='<%= Util.notEmpty(channel.getProperty("$id.jcmsplugin.lanumerique.colonneEpci.portlet")) %>'>
				<jalios:include id='<%=channel.getProperty("$id.jcmsplugin.lanumerique.colonneEpci.portlet") %>'/>
			</jalios:if>
		</div>
	
	</div>      

</div>
