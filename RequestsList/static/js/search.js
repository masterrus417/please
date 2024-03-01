$(document).ready(function(){
	
	const host = window.location.protocol + '//' + window.location.host + window.location.pathname;

	
	function getCsrfToken(){
		const cookieValue = document.cookie.split('; ').find(row=> row.startsWith('csrftoken=')).split('=')[1];
		return cookieValue;
	}
	
	$('#btnCalculate').click(function(){
		let message = document.getElementById("message");
		let alert = document.createElement("div");
		message.style.display = "block"
		message.innerHTML = "";
		alert.classList.add("alert");
		alert.role = "alert";
		$("#loadCalc").show();
		$("#btnCalculate").prop("disabled",true);
		$.ajax
		({
				url: host + "demand_calc_quater/",
				method: "POST",
				headers: {
					'X-CSRFToken': getCsrfToken()
				},
				dataType:'json',
				success: function(response)
				{	
					if (response['status'] == '1'){
						alert.classList.add("alert-danger");	
					} 
					else
					{
						alert.classList.add("alert-success");
					};
					alert.textContent = response['message']
					message.appendChild(alert);
					$("#btnCalculate").prop("disabled",false);
					$("#loadCalc").hide();
					setTimeout(function(){message.style.display = "none"},5000);
				},
				error: function (xhr, status, error) {
					$("#btnCalculate").prop("disabled",false);
					$("#loadCalc").hide();
					message.textContent = "Ошибка:" + error;
					setTimeout(function(){message.style.display = "none"},5000);
        }
		});
		
	});
	
	
	$('#btnClear').click(function(){
		inputGroup.value = "";
		inputMTR.value = "";
	});



	$("#btnSearch").click(function()
	{
		$("#loadSearch").show();
		$("#btnSearch").prop("disabled",true);
		$("#container_row").empty();
		Search(inputMTR.value,inputGroup.value);
	});



	function Search(mtr,group){
		$.ajax({
			url: host + "demand_objects/",
			type: "GET",
			dataType: "json",
			data: { mtr: mtr,
				group : group
			},
			success: function (response) 
			{
				for(i=0; i < response.length; i++ )	
				{
					let json_str = response[i];

					let tr = document.createElement('tr');
					let td1 = document.createElement('td');
					let td2 = document.createElement('td');
					let td3 = document.createElement('td');
					let td4 = document.createElement('td');
					let td5 = document.createElement('td');
					let td6 = document.createElement('td');
					let td7 = document.createElement('td');
					let td8 = document.createElement('td');
					let td9 = document.createElement('td');
					let td10 = document.createElement('td');
					let td11 = document.createElement('td');
					let td12 = document.createElement('td');
					let td13 = document.createElement('td');
					let td14 = document.createElement('td');
					let td15 = document.createElement('td');
					let td16 = document.createElement('td');
					let td17 = document.createElement('td');
					let td18 = document.createElement('td');
					let td19 = document.createElement('td');

					td1.textContent = json_str['plan_year'];
					td1.classList.add('text-center');
					td1.classList.add('text-row-size');
					td1.classList.add('custom-date');

					td2.textContent = json_str['div_no'];
					td2.classList.add('text-center');
					td2.classList.add('text-row-size');
					td2.classList.add('department');
					
					td3.textContent = json_str['mtr_code'];
					td3.classList.add('text-center');
					td3.classList.add('text-row-size');
					td3.classList.add('mtr-code');
					
					td4.textContent = json_str['mtr_characteristic'];
					td4.classList.add('text-row-size');
					
					td5.textContent = json_str['sing_product'];
					td5.classList.add('text-center');
					td5.classList.add('text-row-size');
					
					td6.textContent = json_str['ut_code_tech'];
					td6.classList.add('text-center');
					td6.classList.add('text-row-size');
					
					td7.textContent = json_str['ut_code_ref'] + " (" + json_str['mu_name'] + ")";
					td7.classList.add('text-center');
					td7.classList.add('text-row-size');
					
					td8.textContent = json_str['previous_1_quarter'];
					td8.classList.add('col-number');
					td8.classList.add('text-row-size');
					
					td9.textContent = json_str['previous_2_quarter'];
					td9.classList.add('col-number');
					td9.classList.add('text-row-size');
					
					td10.textContent = json_str['previous_3_quarter'];
					td10.classList.add('col-number');
					td10.classList.add('text-row-size');
					
					td11.textContent = json_str['previous_4_quarter'];
					td11.classList.add('col-number');
					td11.classList.add('text-row-size');

					td12.textContent = json_str['current_1_quarter'];
					td12.classList.add('col-number');
					td12.classList.add('text-row-size');
					
					td13.textContent = json_str['current_2_quarter'];
					td13.classList.add('col-number');
					td13.classList.add('text-row-size');
					
					td14.textContent = json_str['current_3_quarter'];
					td14.classList.add('col-number');
					td14.classList.add('text-row-size');
					
					td15.textContent = json_str['current_4_quarter'];
					td15.classList.add('col-number');
					td15.classList.add('text-row-size');
					
					td16.textContent = json_str['next_1_quarter'];
					td16.classList.add('col-number');
					td16.classList.add('text-row-size');
					
					td17.textContent = json_str['next_2_quarter'];
					td17.classList.add('col-number');
					td17.classList.add('text-row-size');
					
					td18.textContent = json_str['next_3_quarter'];
					td18.classList.add('col-number');
					td18.classList.add('text-row-size');
					
					td19.textContent = json_str['next_4_quarter'];
					td19.classList.add('col-number');
					td19.classList.add('text-row-size');
					
					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
					tr.appendChild(td7);
					tr.appendChild(td8);
					tr.appendChild(td9);
					tr.appendChild(td10);
					tr.appendChild(td11);
					tr.appendChild(td12);
					tr.appendChild(td13);
					tr.appendChild(td14);
					tr.appendChild(td15);
					tr.appendChild(td16);
					tr.appendChild(td17);
					tr.appendChild(td18);
					tr.appendChild(td19);
					
					$("#container_row").append(tr);
				}	
				$("#btnSearch").prop("disabled",false);	
				$("#loadSearch").hide();	
			},
			error: function (xhr, status, error) {
				$("#btnSearch").prop("disabled",false);	
				$("#loadSearch").hide();		
			}
		});
	};



});