$(document).ready(function () {
	

		

	
	$('#btnClear').click(function(){
		cardContainer.innerHTML = "";
		inputSearch.value = "";
		btnContainer.innerHTML = "";
		inputSearch.classList.remove("is-invalid");
		inputSearch.classList.remove("is-valid");
		btnSearch.click();
	});


	function Search(Guid)
	{	
		cardContainer.innerHTML = "";
		$("#LoadDiv").show();
		var Search_text = Guid;
		$("#ErrorMessage").hide();
		$.ajax({
        url: "get_objects/",
        type: "GET",
        dataType: "json",
        data: { node_id: Search_text },
        success: function (response) 
				{	
					
					let cardContainer = document.getElementById("cardContainer");
					if (response == null || response.length == 0 || response['branches'] == null) {
						$("#LoadDiv").hide();
						$("#ErrorMessage").textContent = "Нет данных...";
						$("#ErrorMessage").show();
						return;
					};
					
					
					for(var i = 0; i < response['branches'].length; i++){
						var json = response['branches'][i];
						
						// заготовки под карточки
						let cardBorder = document.createElement("div");
						cardBorder.classList.add("col-md-2");
						cardBorder.classList.add("d-flex");
					
						let card = document.createElement("div");
						card.classList.add("card");
						card.classList.add("m-1");
						card.classList.add("custom-shadow");
						card.classList.add("flex-fill")
						
						let type_doc = "";
						
						let img = document.createElement('img');
						img.classList.add('card-img-top');
						img.alt = "...";
						img.width = 90;
						img.height = 90;
						
						if ((json["type_name"] == "documentation_folder") || (json["type_name"] == "documentation"))
							{
								type_doc = "Папка";
								img.src = 'static/img/folder.svg';
							}
						else
							{
								type_doc = "Файл";
								img.src = 'static/img/file.svg';
							};
						
						
						let cardHeader = document.createElement("h5");
						cardHeader.classList.add("card-title");
						cardHeader.classList.add("text-truncate");
						cardHeader.classList.add("m-2");
						cardHeader.textContent = json["title"];
						cardHeader.title = json["title"];
						cardHeader.id = "h" + json["id"]; 
						
						
						
						let cardBody = document.createElement("div");
						cardBody.classList.add("card-body");
						
						
						// let cardGuid = document.createElement("h6");
						// cardGuid.classList.add("card-subtitle");
						// cardGuid.classList.add("m-2");
						// cardGuid.classList.add("text-body-secondary");
						// cardGuid.style.fontSize = "10px"
						// cardGuid.textContent = "Guid:" + json["id"];
						
						let cardGuid = document.createElement("a");
						cardGuid.href = "http://ecp-pilotice.main.ecp:5545/url?id=" + json["id"]; 
						cardGuid.classList.add("card-link")
						cardGuid.textContent = 'Открыть в Pilot...';

						//http://ecp-pilotice.main.ecp:5545/url?id=a6c2cf2b-8a46-4386-a737-353dcfd33944

						// let cardText = document.createElement("p");
						// cardText.classList.add("card-text");
						// cardText.textContent = json["title"];
						// cardText.id = "p" + json["id"];
						
						let buttonId =  json["id"];
						let fileName = "";
						
						let gridBtn = document.createElement("div");
						gridBtn.classList.add("d-grid");
						gridBtn.classList.add("gap-2");
						gridBtn.classList.add("mx-auto");
						
						if (type_doc == "Файл")
							{
								if (response['branches_dop'] != null)
								{
									let ico = document.createElement('i');
									ico.classList.add("bi");
									ico.classList.add("bi-cloud-upload-fill");
									
									let fl = response['branches_dop'].filter(obj=>obj["parent"]===buttonId);
									
									for (let i = 0; i < fl.length; i++ )
									{	
										_file_ = fl[i]
										let btn = document.createElement("button");
										btn.classList.add("btn");
										btn.classList.add("btn-success");
										btn.classList.add("btn-sm");
										btn.appendChild(ico);
										
										if (_file_["fileName"] == "(источник)")
										{
											btn.textContent = '(док) ' + cardHeader.textContent;
										}
										else
										{
										btn.textContent = _file_["fileName"];
										}
										
										btn.type = "button";
										btn.addEventListener("click",function(){
											btnDownloadFileClick(buttonId,btn.textContent);
										});
										gridBtn.appendChild(btn);
										
									}
								}
							}
						else
							{
								let btn = document.createElement("button")
								btn.classList.add("btn");
								btn.classList.add("btn-success");
								btn.classList.add("btn-sm");
								btn.textContent = "Открыть";
								btn.type = "button";
								btn.addEventListener("click",function(){
									btnOpenFolderClick(buttonId);
								});
						
								gridBtn.appendChild(btn);
							};
					
						card.appendChild(cardHeader);
						card.appendChild(img);
						cardBody.appendChild(gridBtn);
						card.appendChild(cardBody);
						card.appendChild(cardGuid);
						cardBorder.appendChild(card);
						cardContainer.appendChild(cardBorder);
					};
					$("#LoadDiv").hide();
        },
        error: function (xhr, status, error) {
					$("#LoadDiv").hide();
					console.log("Ошибка");
        }
			});
	};


	$("#btnSearch").click(function(){
		btnContainer.innerHTML = "";
		
		var inputSearch = document.getElementById("inputSearch");
		var inputSearchValid = document.getElementById("inputSearchInvalid");
		
		if((inputSearch.value.length < 4) && (inputSearch.value != ''))
		{
			inputSearch.classList.add("is-invalid");
			inputSearchValid.textContent = "Минимальная длина запроса 5 символов";
			return;
		}
		else
		{	
			inputSearch.classList.remove("is-invalid");
			inputSearch.classList.add("is-valid");
		}
			
		let btnClick = document.getElementById('n' + inputSearch.value)
		
		if (!btnClick)
		{

			let btnPanel = document.getElementById("btnContainer");
			let p = document.getElementById('h' + inputSearch.value);
			let btn = document.createElement('button');
			btn.classList.add("btn");
			btn.classList.add("btn-outline-primary");
			btn.classList.add("btn-sm");
			btn.type = "button";
			btn.id = 'n' + inputSearch.value;
			
			console.log(inputSearch.value);
			if (inputSearch.value == "")
			{
				btn.textContent = 'Root';
			}
			else
			{
				btn.textContent = inputSearch.value;
			}
			btn.addEventListener("click",function(){
				btnOpenFolderClick(inputSearch.value);
			});

			btnPanel.appendChild(btn);
		};
		
		Search(inputSearch.value);
  });

	function btnOpenFolderClick(buttonId){
		
		let btnClick = document.getElementById('n' + buttonId)
		
		if (!btnClick)
		{

			let btnPanel = document.getElementById("btnContainer");
			let p = document.getElementById('h' + buttonId);
			let btn = document.createElement('button');
			btn.classList.add("btn");
			btn.classList.add("btn-outline-primary");
			btn.classList.add("btn-sm");
			btn.type = "button";
			btn.id = 'n' + buttonId;
			btn.textContent = p.textContent;
			
			btn.addEventListener("click",function(){
				btnOpenFolderClick(buttonId);
			});

			btnPanel.appendChild(btn);
		};
		
		Search(buttonId);
		

		
	};

	function btnDownloadFileClick(buttonId,fileName){
		$.ajax
		({
				url: "pilot_path_file/",
				method: "GET",
				data:
				{ 
						node_id: buttonId,
						file_name : fileName,
				},
				xhrFields: {
					responseType: 'blob'
				},
				success: function(data, status, xhr)
				{	
					const regex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/i; //регулярное выражение для поска имени файла
					let link = document.createElement("a")
					
					let matches = xhr.getResponseHeader("Content-Disposition").match(regex);
					const url = URL.createObjectURL(data);
					
					let dName = decodeURIComponent(matches[1].replace(/['"]/g,'')); //передаем в формате последовательности
					
					link.href = url;
					link.download = dName;
					
					if (dName == "file not found")
					{
						console.log('Файл не загружен')
						return;
					}
					
				
					document.body.appendChild(link);
					link.click();
					document.body.removeChild(link);
					
				},
				error: function (xhr, status, error) {
					console.log('Ошибка загрузки');
        } 
		});
	};
	// $('#tree').jstree({
	// 	core:{
	// 		data: TreeData
	// 	}
	// });
	btnSearch.click();
});
