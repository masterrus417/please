let u=location.href.match(/\/([^\/]+)\/([^\/]+)$/);
if(!u){alert("Откройте страницу расширения");throw new Error("Не страница расширения");}
let p=u[1],e=u[2];
fetch("https://marketplace.visualstudio.com/_apis/public/gallery/extensionquery",{
  method:"POST",
  headers:{
    "Content-Type":"application/json",
    "Accept":"application/json;api-version=3.0-preview.1"
  },
  body:JSON.stringify({
    filters:[{criteria:[{filterType:7,value:p+"."+e}]}],
    flags:103
  })
}).then(r=>r.json()).then(j=>{
  let a=j.results[0].extensions[0].versions[0].files.find(f=>f.assetType==="Microsoft.VisualStudio.Services.VSIXPackage");
  if(a){
    window.open(a.source)
  } else {
    alert("VSIX не найден")
  }
});


