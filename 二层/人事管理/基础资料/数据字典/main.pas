unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB,
  ADODB, Menus;

type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Grd1: TDBGridEh;
    Grd2: TDBGridEh;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4_See: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd2TitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure fun(Sender:TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N4_SeeClick(Sender: TObject);
    procedure Grd2DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses dmo, InsertDetail, common, form_Main1;


{$R *.dfm}



procedure TForm_Main.FormCreate(Sender: TObject);
begin
 {} if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;  
  self.Caption:=application.Title;

  {dm.ADOConn.Close;
  dm.ADOConn.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConn.Open;
  rkey73 := '2522';
  vprev:='2';}

  if StrToInt(vprev)in[1,3] then
  begin
    dm.ADODict   .LockType:=ltReadOnly;
    dm.ADODetail .LockType:=ltReadOnly;
  end;

  dm.ADODict.Open;
  PageControl1.TabIndex := 0;
  panel3.Visible := false;
//  DM.ADODetail.Close;
//  DM.ADODetail.Parameters[0].Value:=DM.ADODictrkey.Value;
//  dm.ADODetail.Open;

end;

procedure TForm_Main.PageControl1Change(Sender: TObject);
begin
  if PageControl1.TabIndex=1 then
  begin
    panel3.Visible := true;
    DM.ADODetail.Close;
    DM.ADODetail.Parameters[0].Value:=DM.ADODictrkey.Value;
    DM.ADODetail.Open;
    Grd2TitleClick(grd2.Columns[0]);
    grd2.SetFocus;
    if dm.ADODictrkey.AsInteger = 1 then
    begin
     grd2.Columns[2].Title.Caption := '培训关联';
     grd2.Columns[3].Title.Caption := '合同预提示月数';
     grd2.Columns[4].Title.Caption:= '合同最大份数';
     grd2.Columns[2].Visible := true;
     grd2.Columns[3].Visible := true;
     grd2.Columns[4].Visible := true;

    end
    else
    begin
     grd2.Columns[2].Visible := false;
     grd2.Columns[3].Visible := false;
     grd2.Columns[4].Visible := false;
    end;


  end
  else
  panel3.Visible := false;

end;

procedure TForm_Main.Grd1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADODict.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADODict.IndexFieldNames:=Column.FieldName;
  end;
end;

procedure TForm_Main.Grd2TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    dm.ADODetail.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADODetail.IndexFieldNames:=Column.FieldName;
  end;
    label1.Caption:=column.Title.Caption + ':';
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn := column;

end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
  if Assigned (frm_Main1)=False then
  Application.CreateForm(Tfrm_Main1, frm_Main1);
  DM.ADODetail.Append;
  frm_Main1.ET( frm_Main1);
  frm_Main1.DBCheckBox1.Visible := false;
  frm_Main1.dbcheckbox1.Enabled := False;
  frm_Main1.lbdefined1.Visible := false;
  frm_Main1.lbdefined2.Visible := false;
  frm_Main1.dbdefined1.Visible := false;
  frm_Main1.dbdefined2.Visible := false;
  frm_Main1.label3.Caption := '备注';

 case dm.ADODictrkey.AsInteger of
 1 :
  begin
    frm_Main1.DBCheckBox1.Visible := true;
    frm_Main1.dbcheckbox1.Enabled :=true;
    frm_Main1.lbdefined1.Visible := true;
    frm_Main1.lbdefined2.Visible := true;
    frm_Main1.dbdefined1.Visible := true;
    frm_Main1.dbdefined2.Visible := true;
    frm_Main1.lbdefined1.Caption :='合同预提示月数';
    frm_Main1.lbdefined2.Caption :='合同最大份数';
    frm_Main1.label3.Caption := '职务说明书';
  end ;
   19 :
  begin
    frm_Main1.label3.Caption := '籍贯';
  end  ;

  end;
  frm_Main1.ShowModal;
  
{  fun(nil);
  DM.ADODetail.Append;
  if Form_InsertDetail.ShowModal=mrOk then
  begin
    ShowMessage('增加成功');
    PageControl1.TabIndex:=0;
  end;  }
end;

procedure TForm_Main.fun(Sender:TObject);
var
  i:Integer;
begin
  Form_InsertDetail:=TForm_InsertDetail.Create(Application);
  Form_InsertDetail.ComboBox1.Items.Clear;
  i:=DM.ADODict.RecNo;
  DM.ADODict.DisableControls;
  DM.ADODict.First;
  while not DM.ADODict.Eof do
  begin
    Form_InsertDetail.ComboBox1.Items.Add(DM.ADODictitem.Value);
    dm.ADODict.Next;
  end;
  dm.ADODict.MoveBy(i-dm.ADODict.RecNo);
  Form_InsertDetail.ComboBox1.ItemIndex:=DM.ADODict.RecNo-1;
  dm.ADODict.EnableControls;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
  if dm.ADODetail.Eof then abort;
  if Assigned (frm_Main1)=False then
  Application.CreateForm(Tfrm_Main1, frm_Main1);
  DM.ADODetail.Edit;
  frm_Main1.ET( frm_Main1);
  frm_Main1.DBCheckBox1.Visible := false;
  frm_Main1.lbdefined1.Visible := false;
  frm_Main1.lbdefined2.Visible := false;
  frm_Main1.dbdefined1.Visible := false;
  frm_Main1.dbdefined2.Visible := false;
  frm_Main1.label3.Caption := '备注';

 case dm.ADODictrkey.AsInteger of
 1 :
  begin
    frm_Main1.DBCheckBox1.Visible := true;
    frm_Main1.dbcheckbox1.Enabled := true;
    frm_Main1.lbdefined1.Visible := true;
    frm_Main1.lbdefined2.Visible := true;
    frm_Main1.dbdefined1.Visible := true;
    frm_Main1.dbdefined2.Visible := true;
    frm_Main1.lbdefined1.Caption :='合同预提示月数';
    frm_Main1.lbdefined2.Caption :='合同最大份数';
    frm_Main1.label3.Caption := '职务说明书';
  end ;
   19 :
  begin
    frm_Main1.label3.Caption := '籍贯';
  end  ;

  end;
  frm_Main1.ShowModal;
{  fun(nil);
  Form_InsertDetail.Edit1.Text:=DM.ADODetailitem.Value;
  Form_InsertDetail.Memo1.Text:=DM.ADODetailmemo.Value;
  Form_InsertDetail.ComboBox1.Enabled:=False;
  dm.ADODetail.Edit;
  if Form_InsertDetail.ShowModal=mrOk then
    ShowMessage('修改成功');}
end;

procedure TForm_Main.N3Click(Sender: TObject);
begin
  if dm.ADODetail.Eof then abort;
 if MessageBox(Handle,'数据一旦删除无法恢复，您确定要删除这条记录吗？','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=idno then
    Exit;
  DM.ADOConn.BeginTrans;
  try
    DM.ADODetail.Delete;
    dm.ADOConn.CommitTrans;
    //ShowMessage('数据删除成功!');
  except
    dm.ADOConn.RollbackTrans;
  end;
end;

procedure TForm_Main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Main.FormShow(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    N1.Enabled:=False;
    N2.Enabled:=False;
    N3.Enabled:=False;
  end;
end;

procedure TForm_Main.N4_SeeClick(Sender: TObject);
begin
  if dm.ADODetail.Eof then abort;
  
  if Assigned (frm_Main1)=False then
  Application.CreateForm(Tfrm_Main1, frm_Main1);
  frm_Main1.EF( frm_Main1);
  DM.DSDetailStateChange(DM.DSDetail);
  with  frm_Main1 do
  begin
    btInsert.Enabled:=False;
    btEdit.Enabled:=False;
    btDelete.Enabled:=False;
    dbcheckbox1.Enabled:=False;
  end;
  frm_Main1.DBCheckBox1.Visible := false;
  frm_Main1.lbdefined1.Visible := false;
  frm_Main1.lbdefined2.Visible := false;
  frm_Main1.dbdefined1.Visible := false;
  frm_Main1.dbdefined2.Visible := false;
  frm_Main1.label3.Caption := '备注';

 case dm.ADODictrkey.AsInteger of
 1 :
  begin
    frm_Main1.DBCheckBox1.Visible := true;
    frm_Main1.lbdefined1.Visible := true;
    frm_Main1.lbdefined2.Visible := true;
    frm_Main1.dbdefined1.Visible := true;
    frm_Main1.dbdefined2.Visible := true;
    frm_Main1.lbdefined1.Caption :='合同预提示月数';
    frm_Main1.lbdefined2.Caption :='合同最大份数';
    frm_Main1.label3.Caption := '职务说明书';
  end ;
   19 :
  begin
    frm_Main1.label3.Caption := '籍贯';
  end  ;

  end;
  frm_Main1.ShowModal;
end;

procedure TForm_Main.Grd2DblClick(Sender: TObject);
begin
  N4_See.Click 
end;

procedure TForm_Main.Edit1Change(Sender: TObject);
begin
    if trim(Edit1.text) <> '' then
      Grd2.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')' 
    else
      Grd2.DataSource.DataSet.Filter:='';
end;

end.
