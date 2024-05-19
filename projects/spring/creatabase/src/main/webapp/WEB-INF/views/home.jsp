<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"               prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags"   prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">

      <div class="row mb-5">
        <div class="col-lg-12">
          <div class="bs-component">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="#">Library</a></li>
              <li class="breadcrumb-item active">Data</li>
            </ol>
          </div>
        </div>
      </div>
      <!-- Containers ================================================== -->
      <div class="row">
        <div class="col-lg-12">
          <div class="bs-component">
          
            <div class="card mb-3">
              <h3 class="card-header mb-1">
              <div class="d-flex w-100 justify-content-between">
                  <h3 class="mb-1">Card header</h5>
                  <small style="font-size:13px;">3 days ago</span>
              </div>
              </h3>
              <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <h6 class="card-subtitle text-muted">Support card subtitle</h6>
              </div>
              <center><img src="${path}/img/thumbnail.png" width="50%"/></center>
              <div class="card-body">
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">Cras justo odio</li>
                <li class="list-group-item">Dapibus ac facilisis in</li>
                <li class="list-group-item">Vestibulum at eros</li>
              </ul>
              <div class="card-body">
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
              </div>
              <div class="card-footer text-muted">
                2 days ago
              </div>
            </div>
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">Card title</h4>
                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
              </div>
            </div>
          
            <div class="card text-white bg-primary mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Primary card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card text-white bg-secondary mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Secondary card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card text-white bg-success mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Success card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card text-white bg-danger mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Danger card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card text-white bg-warning mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Warning card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card text-white bg-info mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Info card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card bg-light mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Light card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card text-white bg-dark mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Dark card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            
            
            <div class="card border-primary mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Primary card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card border-secondary mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Secondary card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card border-success mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Success card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card border-danger mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Danger card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card border-warning mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Warning card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card border-info mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Info card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card border-light mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Light card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            <div class="card border-dark mb-3">
              <div class="card-header">Header</div>
              <div class="card-body">
                <h4 class="card-title">Dark card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
              </div>
            </div>
            
          </div>
        </div>
      </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    