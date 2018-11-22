unit PasImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TfrmImport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnExport: TBitBtn;
    btnImport: TBitBtn;
    sgImport: TStringGrid;
    cbbtype: TComboBox;
    Label1: TLabel;
    btnCheck: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
  private
    procedure sgclear(sgrid:TStringGrid);
    procedure load_xls_to_sgrid(fileName:String; grid:TStringGrid);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImport: TfrmImport;

implementation

uses DAMO,common,ComObj,MyClass;

{$R *.dfm}

procedure TfrmImport.FormShow(Sender: TObject);
begin
  with sgImport do
  begin
    Cells[0,0]:='房间名称';
    Cells[1,0]:='抄表度数';
    Cells[2,0]:='抄表时间';
    Cells[3,0]:='是否复核';
    Cells[4,0]:='备注';
  end;
end;

procedure TfrmImport.btnExportClick(Sender: TObject);
begin
  common.Export_Grid_to_Excel(sgImport,Application.Title,True);
end;

procedure TfrmImport.btnImportClick(Sender: TObject);
var
  i:Integer;
  odl:TOpenDialog;
begin
  try
    odl:=TOpenDialog.Create(nil);
    odl.Filter:='*.xls|*.xls';
    odl.DefaultExt:='xls';
    if odl.Execute then
    begin
      if sgImport.RowCount>2 then
      begin
        sgclear(sgImport);
      end;
      load_xls_to_sgrid(odl.FileName,sgImport);
      ShowMessage('导入完成，请点保存！');
    end;
  finally
    odl.Free;
  end;
end;

procedure TfrmImport.load_xls_to_sgrid(fileName: String;
  grid: TStringGrid);
var //从Excel中读取数据到 Grid
  iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
   XLApp := CreateOleObject('Excel.Application'); //创建OLE对象
  except
   Screen.Cursor := crDefault;
   Exit;
  end;
  try
   XLApp.workBooks.Open(fileName);
   Sheet := XLApp.activesheet;
   for iCount:=2 to 65535 do
    begin
      if trim(XLApp.activesheet.cells[iCount,1]) = '' then
         break
      else
      begin
        grid.RowCount:=grid.RowCount+1;
        for jCount:=1 to 4 do
        begin
          grid.Cells[jCount-1,iCount-1]:=sheet.cells[iCount,jCount];
          if grid.Cells[jCount-1,iCount-1]='' then grid.Cells[5,iCount-1]:=' 存在空值 '
        end
      end;
    end;
   XLApp.workbooks[1].close;
  finally
    XLApp.quit;
    Screen.Cursor := crDefault;
  end
end;

procedure TfrmImport.btnSaveClick(Sender: TObject);
var
  tmpstr:string;
  i,irow,icol:Integer;
  ic:TMyDataClass;
begin
  if sgImport.RowCount<=2 then Exit;
  if Trim(cbbtype.Text)='' then
  begin
    ShowMessage('请先选择抄表类型');
    cbbtype.SetFocus;
    Exit;
  end;
  screen.Cursor:= crHourGlass;
  try
    ic:=TMyDataClass.Create(dm.ADOConnection1);
    tmpstr:='if exists (select id from tempdb.dbo.sysobjects where id= '+
          ' object_id(N''tempdb..#record'') and type=''U'' )' +#13+
          ' begin ' +#13+
          ' drop table #record' +#13+
          ' end ' +#13+
          ' create table #record(roomid int,r_name nvarchar(10),record_count decimal(10,2),'+
          ' record_date datetime,type char(10),operator int,ope_time datetime, '+
          ' ischecked bit,strchecked nvarchar(10),remark nvarchar(50))';
    ic.ExecSql(tmpstr);
    tmpstr:='';
    for i:=1 to sgImport.RowCount-2 do
    begin
      with sgImport do
      begin
        if sgImport.Cells[5,i]<>'' then Continue;
        tmpstr:= 'insert into #record(roomid,r_name,record_count,record_date,type,operator, '+
          ' ope_time,strchecked,ischecked,remark) values(0,'+ QuotedStr(Trim(Cells[0,i]))+','+
          Trim(Cells[1,i])+','+ QuotedStr(Trim(Cells[2,i]))+','+
          QuotedStr(Copy(cbbtype.Items[cbbtype.itemindex],1,1))+','+ user_ptr+','+
          QuotedStr(FormatDateTime('yyyy-MM-dd HH:MM:SS',getsystem_date(DM.adoTmp,0)))+','+
          QuotedStr(Trim(Cells[3,i]))+ ',0,'+ QuotedStr(Trim(Cells[4,i]))+')'+#13+ tmpstr;
      end;
    end;
//    ShowMessage(tmpstr);
    ic.ExecSql(tmpstr);
    tmpstr:='update #record set roomid= bedroommsg.rkey,ischecked= '+
        ' case when strchecked=''是'' then 1 else 0 end'+ #13+
        ' from #record join bedroommsg on bedroommsg.r_name=#record.r_name ';
    ic.ExecSql(tmpstr);
    tmpstr:='insert into bedroom_equipment_record '+#13+
            'select roomid,record_date,record_count,type,operator,ope_time,remark,ischecked '+#13+
            'from #record where roomid <> 0';
    ic.ExecSql(tmpstr,True);
    tmpstr:='select r_name,record_count,record_date,strchecked,remark ' +#13+
            'from #record where roomid = 0';
    ic.OpenQuery(DM.adoTmp,tmpstr);
    if not DM.adoTmp.IsEmpty then
    begin
      if MessageDlg('只保存了正确数据，是否导出有误的记录？',mtConfirmation,[mbYes,mbNo],0)=mryes then
      begin
        for i:=sgImport.RowCount-2 downto 1 do
        begin
          if sgImport.Cells[5,i]<>'' then Continue;
          for irow:= i to sgImport.RowCount-2 do
          sgImport.Rows[irow]:=sgImport.Rows[irow+1];
          sgImport.RowCount:=sgImport.RowCount-1;
        end;
        DM.adoTmp.First;
        while not DM.adoTmp.Eof do
        begin
          irow:=sgImport.RowCount-1;
          for icol:=0 to DM.adoTmp.FieldCount-1 do
          begin
            sgImport.Cells[icol,irow]:=DM.adoTmp.Fields[icol].Value;
            sgImport.Cells[icol+1,irow]:='房间名有误'+ sgImport.Cells[icol+1,irow];
          end;
          sgImport.RowCount:=sgImport.RowCount+1;
          irow:=irow+1;
          DM.adoTmp.Next;
        end;
        Export_Grid_to_Excel(sgImport,'有误记录',True);
      end;
    end;
    ModalResult:=mrYes;
  finally
    Screen.Cursor:=crDefault;
    ic.Free;
  end;
end;

procedure TfrmImport.sgclear(sgrid: TStringGrid);
var
  i:Integer;
begin
  for i:=1 to sgrid.RowCount-2 do
    sgrid .Rows[i].Clear;
  sgrid.RowCount:=2;
end;

procedure TfrmImport.btnCheckClick(Sender: TObject);
var
  i:Integer;
  tmp:Double;
begin
  for i:=1 to sgImport.RowCount-2 do
  begin
    if not TryStrToFloat(sgImport.Cells[1,i],tmp) then
      sgImport.Cells[5,i]:=sgImport.Cells[5,i]+' 抄表度数格式不对 ';
  end;
end;

end.
