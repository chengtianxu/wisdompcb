unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, Grids, DBGrids, ComCtrls, Menus,
  Mask, DBCtrls, ExtCtrls,ComObj,ADODB;

type
  TForm1 = class(TForm)
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    add: TMenuItem;
    edit: TMenuItem;
    copydate: TMenuItem;
    delete: TMenuItem;
    ADOConnection1: TADOConnection;
    Panel1: TPanel;
    vpass: TLabel;
    lblFilter: TLabel;
    BitBtn2: TBitBtn;
    edtFilter: TEdit;
    BtBrush: TBitBtn;
    ADOTable1: TADOQuery;
    ADOTable1RKEY: TAutoIncField;
    ADOTable1PR_GRP_CODE: TStringField;
    ADOTable1PRODUCT_GROUP_NAME: TStringField;
    ADOTable1PR_GRP_SEEDVALUE: TStringField;
    ADOTable1PR_GRP_INCREMENTBY: TSmallintField;
    ADOTable1active2: TStringField;
    ADOTable1active: TBooleanField;
    BitBtn3: TBitBtn;
    ADOTable1REVIEW_DAYS: TIntegerField;
    ADOTable1custReciveDay: TIntegerField;
    ADOTable1AlterDay: TIntegerField;
    procedure bitbtn1Click(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure addClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure copydateClick(Sender: TObject);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ADO0741AfterDelete(DataSet: TDataSet);
    procedure ADO0741DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure BtBrushClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
  PreColumn: TColumn;  
  field_name:string;
  public
    { Public declarations }
  procedure CopyDbDataToExcel(Args:array of const);
  end;

var
  Form1: TForm1;

implementation

uses editgroup,common;

{$R *.dfm}

procedure TForm1.bitbtn1Click(Sender: TObject);
begin
close;
application.Terminate;
end;

procedure TForm1.editClick(Sender: TObject);
begin
if not adotable1.IsEmpty then
 begin
 form2:=tform2.Create(application);
 adotable1.Edit;
 form1.Hide;
 form2.DBEdit1.SelectAll;
 form2.showmodal;
 form2.Free;
 end;
end;

procedure TForm1.addClick(Sender: TObject);
var
 bk:tbookmark;
begin
 form2:=tform2.Create(application);
 bk:=adotable1.GetBookmark();
 form1.Hide;
 adotable1.Append;
 adotable1.FieldValues['PR_GRP_INCREMENTBY']:=1;
 adotable1.FieldValues['PR_GRP_SEEDVALUE']:='1';
 if form2.ShowModal<>mrok then
  adotable1.GotoBookmark(bk);
 form2.Free;
 adotable1.FreeBookmark(bk);
end;

procedure TForm1.deleteClick(Sender: TObject);
begin
 if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  adotable1.Delete;
end;

procedure TForm1.copydateClick(Sender: TObject);
var
v_name,v_seed:string;
v_increment,i:integer;
 bk:tbookmark;
begin
form2:=tform2.Create(application);
v_name:=adotable1.FieldValues['product_group_name'];
v_seed:=adotable1.FieldValues['pr_grp_seedvalue'];
v_increment:=adotable1.FieldValues['pr_grp_incrementby'];

 with form2.adoquery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select data0034.dept_code,data0034.dept_name,data0034.rkey,');
   sql.Add('data0091.if_puthdate,data0091.puth_info');
   sql.Add('from data0091 inner join data0034 on data0091.dept_ptr=data0034.rkey');
   sql.Add('where data0091.group_ptr='+form1.ADOTable1.fieldbyname('rkey').AsString);
   active:=true;
   if not IsEmpty then
   begin
    form2.stringgrid1.RowCount:=RecordCount+2;
    for i:=1 to RecordCount do
    begin
     form2.stringgrid1.Cells[0,i] := fieldvalues['dept_code'];
     form2.stringgrid1.Cells[1,i] := fieldvalues['dept_name'];
     if fieldvalues['if_puthdate']=0 then
      form2.stringgrid1.Cells[2,i] := '否'
     else
      form2.stringgrid1.Cells[2,i] := '是';
     form2.stringgrid1.Cells[3,i] := fieldbyname('puth_info').AsString;
     form2.stringgrid1.Cells[4,i] := fieldbyname('rkey').AsString;
     Next;
    end;
   end;
  end;

 with form2.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('SELECT Data0277.CATEGORY_NAME,Data0278.PARAMETER_NAME,Data0278.PARAMETER_DESC,');
   sql.Add('Data0002.UNIT_NAME,Data0278.DATA_TYPE,Data0087.ttype,Data0087.PARAMETER_PTR');
   sql.Add('FROM Data0278 INNER JOIN');
   sql.Add('Data0277 ON Data0278.CATEGORY_PTR = Data0277.RKEY INNER JOIN');
   sql.Add('Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY INNER JOIN');
   sql.Add('Data0087 ON Data0278.RKEY = Data0087.PARAMETER_PTR');
   sql.Add('where data0087.group_ptr='+form1.ADOTable1.fieldbyname('rkey').AsString);
   sql.Add('ORDER BY Data0087.SEQ_NO');
   active:=true;
   if not IsEmpty then
   begin
    form2.stringgrid2.RowCount:=RecordCount+2;
    for i:=1 to RecordCount do
    begin
     form2.stringgrid2.Cells[0,i] := fieldvalues['category_name'];
     form2.stringgrid2.Cells[1,i] := fieldvalues['parameter_name'];
     form2.stringgrid2.Cells[2,i] := fieldvalues['parameter_desc'];
     form2.stringgrid2.Cells[3,i] := fieldvalues['unit_name'];
     if fieldvalues['data_type']=1 then
      form2.stringgrid2.Cells[4,i] := '数字'
     else
      if fieldvalues['data_type']=2 then
       form2.stringgrid2.Cells[4,i] := '字符';
     if fieldvalues['ttype']=0 then
      form2.stringgrid2.Cells[5,i] :='常规'
     else
      form2.stringgrid2.Cells[5,i] :='后补';
     form2.stringgrid2.Cells[6,i] := fieldbyname('parameter_ptr').AsString;
     Next;
    end;
   end;
  end;

 bk:=adotable1.GetBookmark();
 adotable1.Append;
 form1.Hide;
 adotable1.FieldValues['product_group_name']:=v_name;
 adotable1.FieldValues['pr_grp_seedvalue']:=v_seed;
 adotable1.FieldValues['pr_grp_incrementby']:=v_increment;
 if form2.ShowModal<>mrok then adotable1.GotoBookmark(bk);
 form2.Free;
 adotable1.FreeBookmark(bk);
end;

procedure TForm1.ADOTable1AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm1.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
if pos('Data0008',e.Message)>0 then
 BEGIN
  messagedlg('该记录用于产品类型表!不能删除',mtwarning,[mbok],0);
  abort;
 END;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];
if Key = Chr(vk_Back) then       //如果按下了backspace
   begin
    if length(bar1.SimpleText)>5 then
     bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
    if length(bar1.SimpleText)>5 then
     Adotable1.Locate('pr_grp_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption)
    else
     adotable1.First
   end
  else
    if key=chr(vk_return) then    //如果按下了enter
      editClick(sender)           //调用编辑命令
    ELSE
     begin
     bar1.SimpleText :=bar1.SimpleText+key;
     Adotable1.Locate('pr_grp_code',copy(bar1.SimpleText,6,length(bar1.SimpleText)),searchoption);
     end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not app_init_2(self.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
 self.Caption:=application.Title; 
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if Adoconnection1.Connected then
 begin
  adotable1.Open;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if adotable1.IsEmpty then
  begin
   edit.Enabled:=false;
   copydate.Enabled:=false;
   delete.Enabled:=false;
  end
 else
  begin
   edit.Enabled:=true;
   copydate.Enabled:=true;
   delete.Enabled:=true;
  end;
end;

procedure TForm1.ADO0741AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TForm1.ADO0741DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
if pos('Data0008',e.Message)>0 then
 BEGIN
  messagedlg('该记录用于产品类型表!不能删除',mtwarning,[mbok],0);
  abort;
 END;
end;

procedure TForm1.BtBrushClick(Sender: TObject);
begin
ADOTable1.Close;
ADOTable1.Open;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
CopyDbDataToExcel([DBGrid1]);
end;

procedure TForm1.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;


procedure TForm1.edtFilterChange(Sender: TObject);
begin
  if trim(edtFilter.text)<>'' then
  ADOTable1.Filter := field_name+' like ''%'+trim(edtFilter.text)+'%'''
 else
  ADOTable1.filter := '';
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i :byte;
begin

  ADOTable1.Sort:=column.FieldName;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
   begin
    dbgrid1.Columns[i].Title.Color:= clBtnHighlight;
    break;
   end;
   column.Title.Color:=clred;

   if(column.FieldName<>'active2')then
   edtFilter.ReadOnly:=False
   else
   edtFilter.ReadOnly:=True;



 if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  lblFilter.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edtFilter.SetFocus;
  //PreColumn.Title.Color := clBtnHighlight;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edtFilter.SetFocus;
 end;



end.

