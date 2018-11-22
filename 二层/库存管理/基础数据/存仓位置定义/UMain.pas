unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, ADODB, Menus, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppVar, ppBarCod, ppCtrls, ppPrnabl, ppCache,
  DBGridEh;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnRefresh: TBitBtn;
    btnExit: TBitBtn;
    qry176: TADOQuery;
    ds176: TDataSource;
    qry176rkey: TAutoIncField;
    qry176location: TWideStringField;
    qry176rkey_16: TIntegerField;
    qry176quantity: TBCDField;
    qry176code: TStringField;
    qry176abbr_name: TStringField;
    qry176type: TStringField;
    qry176MLOCATION: TStringField;
    lbl_FName: TLabel;
    pmMain: TPopupMenu;
    mni_SinglePrt: TMenuItem;
    mniMuiltPrt: TMenuItem;
    btn_Qry: TBitBtn;
    btn_Export: TBitBtn;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniDel: TMenuItem;
    ehMain: TDBGridEh;
    btn_Design: TBitBtn;
    edt_FValue: TEdit;
    qry176WAREHOUSE_CODE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mni_SinglePrtClick(Sender: TObject);
    procedure mniMuiltPrtClick(Sender: TObject);
    procedure mniAddClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure btn_DesignClick(Sender: TObject);
    procedure ehMainTitleClick(Column: TColumnEh);
    procedure btn_QryClick(Sender: TObject);
    procedure edt_FValueChange(Sender: TObject);
     
  private
    { Private declarations }
    precolumn:Tcolumneh;
    sql_text:string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses common,udm,Uedit176,uSelLocation, UQry;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  rkey73 :='1';
  vprev :='4';
  user_ptr :='3';

   if not app_init_2(dm.con1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;


 if not qry176.Active then qry176.Open;
   precolumn:=ehMain.Columns[0];
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
//var
 // LBK:TBookmark;
begin
 // LBK:=qry176.GetBookmark;
  qry176.Close;
  qry176.sql.Clear;
  qry176.sql.text:=sql_text;
  qry176.Open;
 // qry176.GotoBookmark(LBK);
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
close;
end;

procedure TfrmMain.btnDelClick(Sender: TObject);
var
  Lsql:string;
begin
  if MessageBox(Handle,'确定删除吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then  exit;
  
  Lsql:='delete from  data0176 where rkey='+qry176.fieldbyname('rkey').AsString+' ';
  dm.execsql(dm.qry_temp,Lsql);
  btnRefreshClick(btnRefresh);
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
begin
 frmEdit176:=TfrmEdit176.Create(self);
 try
   frmEdit176.FEType:=0;
   frmEdit176.Caption:='新增';
   frmEdit176.qry_save176.Parameters.ParamByName('rkey').Value:=-1;
   frmEdit176.qry_save176.Open;

   if frmEdit176.ShowModal=mrok then
    begin
    btnRefreshClick(btnRefresh);
    //qry176.Locate('rkey',frmEdit176.Frkey,[]);
     qry176.last;
    end;
 finally
 frmEdit176.free;
 end;
end;

procedure TfrmMain.btnEditClick(Sender: TObject);
var
  lbk:TBookmark;
begin
 frmEdit176:=TfrmEdit176.Create(self);
 try
   frmEdit176.FEType:=1;
   frmEdit176.frkey:=qry176.fieldbyname('rkey').asinteger;
   frmEdit176.Caption:='编辑';
   frmEdit176.qry_save176.Parameters.ParamByName('rkey').Value:=qry176.fieldbyname('rkey').asinteger;
   frmEdit176.qry_save176.Open;

   frmEdit176.edt_LCode.Tag:=qry176.fieldbyname('rkey_16').AsInteger;
   frmEdit176.edt_LCode.Text:= qry176.fieldbyname('code').asstring;
   frmEdit176.edt_LName.Text:= qry176.fieldbyname('MLocation').asstring;
   frmEdit176.edt_AbbrName.Text:= qry176.fieldbyname('abbr_name').asstring;
   frmEdit176.edt_LType.Text:= qry176.fieldbyname('type').asstring;
   frmEdit176.edt_Location.Text:= qry176.fieldbyname('location').asstring;
   frmEdit176.edt_LQty.Text:= qry176.fieldbyname('Quantity').asstring;

    if frmEdit176.ShowModal=mrok then
    begin
    LBk:=qry176.GetBookmark;
    btnRefreshClick(btnRefresh);
    qry176.GotoBookmark(Lbk);
    end;
 finally
 frmEdit176.free;
 end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
//  cbb_Printer.Items.Assign(DM.PPrpt.PrinterSetup.PrinterNames);
//  if cbb_Printer.Items.Count > 0 then
//    cbb_Printer.ItemIndex := -1;

    sql_text:=qry176.sql.Text;
end;

procedure TfrmMain.mni_SinglePrtClick(Sender: TObject);
var
i,j :integer;
LImg2DBar: TppImage;
lbl1,lbl2:  TppLabel;
LText:string;
begin

//  if cbb_Printer.Text=''  then
//  begin
//  ShowMessage('请先选择打印机!');
//  exit;
//  end;

   if DM.qry_rpt.Active then
   begin
   DM.qry_rpt.close;
   DM.qry_rpt.Open;
   end
   else  DM.qry_rpt.Open;

   DM.qry_rpt.Append;
   DM.qry_rpt.FieldByName('location').Value:=qry176.FieldByName('location').Value;
   dm.qry_rpt.Post;

  if   dm.qry_rpt.isempty then  exit;
    
  LText:=  dm.qry_rpt.fieldbyname('location').AsString;

  DM.pprpt.Reset;
  DM.pprpt.Template.FileName := stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'EP176.rtm';
  DM.pprpt.Template.LoadFromFile;
  DM.pprpt.SaveAsTemplate:=False;

  DM.pprpt.ObjectByName(I,J,'ppimg1');
  LImg2DBar:=DM.pprpt.Bands[I].Objects[J] as TppImage;

  DM.pprpt.ObjectByName(I,J,'pplbl1');
  lbl1:=DM.pprpt.Bands[I].Objects[J] as TppLabel;

  DM.pprpt.ObjectByName(I,J,'pplbl2');
  lbl2:=DM.pprpt.Bands[I].Objects[J] as TppLabel;

  lbl1.Caption:=qry176.fieldbyname('Mlocation').AsString;
  lbl2.Caption:= dm.qry_rpt.fieldbyname('location').AsString;


  dm.Get2DCodeBmp(LText,LImg2DBar.Picture); //二维码复赋给报表img控件

 // DM.pprpt.ShowPrintDialog := False;
 // DM.pprpt.DeviceType := 'Printer';

  DM.pprpt.Print;

   //DM.pprpt.PrinterSetup.PrinterName := cbb_printer.text;
end;


procedure TfrmMain.mniMuiltPrtClick(Sender: TObject);
begin

 FrmSelLocation:=TFrmSelLocation.Create(self);
 try
   if  FrmSelLocation.qry_all.Active then FrmSelLocation.qry_all.Close;
   FrmSelLocation.qry_all.Parameters.ParamByName('rkey_16').Value:=qry176.fieldbyname('rkey_16').asinteger;
   FrmSelLocation.qry_all.Open;

   FrmSelLocation.lbl_WName.Caption:=qry176.fieldbyname('Mlocation').AsString;


   if DM.qry_rpt.Active then
   begin
   DM.qry_rpt.close;
   DM.qry_rpt.Open;
   end
   else  DM.qry_rpt.Open;
   
    FrmSelLocation.ShowModal;

 finally
 FrmSelLocation.free;
 end;
 
end;

procedure TfrmMain.mniAddClick(Sender: TObject);
begin
 frmEdit176:=TfrmEdit176.Create(self);
 try
   frmEdit176.FEType:=0;
   frmEdit176.Caption:='新增';
   frmEdit176.qry_save176.Parameters.ParamByName('rkey').Value:=-1;
   frmEdit176.qry_save176.Open;

   if frmEdit176.ShowModal=mrok then
    begin
    btnRefreshClick(btnRefresh);
    //qry176.Locate('rkey',frmEdit176.Frkey,[]);
     qry176.last;
    end;
 finally
 frmEdit176.free;
 end;
end;

procedure TfrmMain.mniEditClick(Sender: TObject);
var
  lbk:TBookmark;
begin
 frmEdit176:=TfrmEdit176.Create(self);
 try
   frmEdit176.FEType:=1;
   frmEdit176.frkey:=qry176.fieldbyname('rkey').asinteger;
   frmEdit176.Caption:='编辑';
   frmEdit176.qry_save176.Parameters.ParamByName('rkey').Value:=qry176.fieldbyname('rkey').asinteger;
   frmEdit176.qry_save176.Open;

   frmEdit176.edt_LCode.Tag:=qry176.fieldbyname('rkey_16').AsInteger;
   frmEdit176.edt_LCode.Text:= qry176.fieldbyname('code').asstring;
   frmEdit176.edt_LName.Text:= qry176.fieldbyname('MLocation').asstring;
   frmEdit176.edt_AbbrName.Text:= qry176.fieldbyname('abbr_name').asstring;
   frmEdit176.edt_LType.Text:= qry176.fieldbyname('type').asstring;
   frmEdit176.edt_Location.Text:= qry176.fieldbyname('location').asstring;
   frmEdit176.edt_LQty.Text:= qry176.fieldbyname('Quantity').asstring;

    if frmEdit176.ShowModal=mrok then
    begin
    LBk:=qry176.GetBookmark;
    btnRefreshClick(btnRefresh);
    qry176.GotoBookmark(Lbk);
    end;
 finally
 frmEdit176.free;
 end;
end;

procedure TfrmMain.mniDelClick(Sender: TObject);
var
  Lsql:string;
begin
  if MessageBox(Handle,'确定删除吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then  exit;
  
  Lsql:='delete from  data0176 where rkey='+qry176.fieldbyname('rkey').AsString+' ';
  dm.execsql(dm.qry_temp,Lsql);
  btnRefreshClick(btnRefresh);
end;

procedure TfrmMain.btn_DesignClick(Sender: TObject);
begin
    if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    begin
      messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
      exit;
    end;
 
    DM.pprpt.Reset;
    DM.pprpt.Template.FileName :=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'EP176.rtm';
    DM.pprpt.Template.LoadFromFile;
    DM.pprpt.SaveAsTemplate:=true;
    dm.ppdesigner1.ShowModal;

end;

procedure TfrmMain.ehMainTitleClick(Column: TColumnEh);
begin
 if column.Title.SortMarker=smupeh then
 begin
  column.Title.SortMarker:=smdowneh;
  qry176.Sort:=column.FieldName+' DESC';
 end
 else begin
  column.Title.SortMarker:=smupeh;
  qry176.Sort:=column.FieldName;
 end;

 if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
 begin
  lbl_FName.Caption:=column.Title.Caption;
  precolumn.Title.Color:=clbtnface;
  column.Title.Color:=clred;
  precolumn:=column;
  edt_FValue.Text:='';
 end;
 edt_FValue.SetFocus;
end;

procedure TfrmMain.btn_QryClick(Sender: TObject);
var i:integer;
begin
 if frmqry.ShowModal=mrok then
  with qry176 do
  begin
   close;
   SQL.Text:=sql_text; //恢复默认语句
   for i:=1 to frmqry.SGrid1.RowCount-1 do
     SQL.Text:=SQL.Text+frmqry.SGrid1.cells[2,i];
   open;
  end;
end;

procedure TfrmMain.edt_FValueChange(Sender: TObject);
begin
  if trim(edt_FValue.Text)<>'' then
    qry176.Filter:=precolumn.FieldName+' like ''%'+trim(edt_FValue.text)+'%'''
  else qry176.Filter:='';
  qry176.filtered:=true

end;

end.

