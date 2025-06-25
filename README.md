# please
ОПБСК ОК69
javascript:(function(){
  var extId = location.href.match(/\/([^\/]+)\/([^\/]+)$/);
  if (!extId) {
    alert("Откройте страницу расширения на marketplace.visualstudio.com");
    return;
  }
  var publisher = extId[1], ext = extId[2];
  fetch(`https://marketplace.visualstudio.com/_apis/public/gallery/extensionquery`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json;api-version=3.0-preview.1"
    },
    body: JSON.stringify({
      filters: [{criteria: [
        {filterType: 7, value: publisher + '.' + ext}
      ]}],
      flags: 0x1 | 0x2 | 0x80 | 0x100 | 0x200
    })
  })
  .then(r => r.json())
  .then(json => {
    const asset = json.results[0].extensions[0].versions[0].files.find(f => f.assetType === "Microsoft.VisualStudio.Services.VSIXPackage");
    if (asset) {
      const url = asset.source;
      window.open(url, '_blank');
    } else {
      alert("VSIX файл не найден");
    }
  });
})();
