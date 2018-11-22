unit UnDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus;

type
  TFrm_UnDetail = class(TForm)
    StringGrid1: TStringGrid;
    Memo4: TMemo;
    Label2: TLabel;
    Label1: TLabel;
    Label23: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Edit8: TEdit;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    procedure append_608(v_ttype:string);
    { Private declarations }
  public

  no:Integer;
    State:byte;     //1:新增,2:编辑,3:检查
    { Public declarations }
  end;

var
  Frm_UnDetail: TFrm_UnDetail;

implementation

uses Udemo, UDepname,common,ConstVar,Pick_Item_Single;

{$R *.dfm}

procedure TFrm_UnDetail.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='rkey';
 StringGrid1.colwidths[0]:=-1;
 stringgrid1.Cells[1,0]:='工号';
 stringgrid1.Cells[2,0]:='审批人员';
 if Self.State<>0 then
 begin
   if Self.State=2 then
   begin
     Edit8.ReadOnly:=True;
     Memo4.ReadOnly:=True;
     StringGrid1.Enabled:=False;
     BitBtn1.Enabled:=False;
   end;
   Edit8.Text:=dm.ADO607v_ttype.Value;
   Memo4.Text:=dm.ADO607Explain.Value;
   Edit1.Text:=DM.ADO607USER_FULL_NAME.Value;
   Edit1.Tag:=DM.ADO607rkey73.Value;
   
   with dm.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     SQL.Add('select data0073.rkey,data0073.USER_LOGIN_NAME, data0073.USER_FULL_NAME,v_ttype from data0608');
     sql.Add(' left join data0073 on data0608.rkey73=data0073.rkey');
     sql.Add(' where data0608.v_ttype='+quotedstr(dm.ADO607v_ttype.Value));
     sql.Add(' order by data0608.seq_no');
     Open;
     DM.ADOQuery1.First;
     while not Eof do
     begin

      StringGrid1.Cells[0,StringGrid1.RowCount-1]:=FieldByName('rkey').asstring;
      StringGrid1.Cells[1,StringGrid1.RowCount-1]:=FieldByName('USER_LOGIN_NAME').asstring;
      StringGrid1.Cells[2,StringGrid1.RowCount-1]:=FieldByName('USER_FULL_NAME').asstring;
      StringGrid1.RowCount:=StringGrid1.RowCount+1;
      Next;
     end;
   end;
 end;
end;

procedure TFrm_UnDetail.N2Click(Sender: TObject);

begin

  try
  Frm_depname:=TFrm_depname.Create(application);
   if Frm_depname.ShowModal=mrok then
   begin
     stringgrid1.Cells[0,stringgrid1.RowCount-1]:=IntToStr(Frm_depname.Edit2.Tag);
     stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Frm_depname.Label1.Caption;
     stringgrid1.Cells[2,stringgrid1.RowCount-1]:=Frm_depname.Edit2.Text;
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
   end;
  finally
   Frm_depname.Free;
  end;
end;

procedure TFrm_UnDetail.N1Click(Sender: TObject);
//   var
//  i:Integer;
begin
 try
  Frm_depname:=TFrm_depname.Create(application);
  Frm_depname.sdate:=1;
  Frm_depname.Edit2.Tag:=StrToInt(stringgrid1.Cells[0,stringgrid1.Row]);
  Frm_depname.Label1.Caption:= stringgrid1.Cells[1,stringgrid1.Row];
  Frm_depname.Edit2.Text:=stringgrid1.Cells[2,stringgrid1.Row];

   if Frm_depname.ShowModal=mrok then
   begin
     stringgrid1.Cells[0,stringgrid1.Row]:=IntToStr(Frm_depname.Edit2.Tag);
     stringgrid1.Cells[1,stringgrid1.Row]:=Frm_depname.Label1.Caption;
     stringgrid1.Cells[2,stringgrid1.Row]:=Frm_depname.Edit2.Text;
   end;
  finally
   Frm_depname.Free;
 end;
end;

procedure TFrm_UnDetail.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row= stringgrid1.RowCount-1 then
 begin
 n4.Enabled:=false;
 n1.Enabled:=false;
 end
 else
 begin
 n4.Enabled:=true;
 n1.Enabled:=true;
 end;
end;

procedure TFrm_UnDetail.N4Click(Sender: TObject);
var
  i:Integer;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
 stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;

procedure TFrm_UnDetail.BitBtn1Click(Sender: TObject);
begin
 if self.State=0 then  //新增
 begin
 
   with dm.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     SQL.Add('select * from data0607 where v_ttype='+quotedstr(edit8.Text));
     Open;
   end;
  if not dm.ADOQuery1.IsEmpty then
  begin
   ShowMsg('代码已存在,请改换代码!',1);
   Exit;
  end;
  try
  dm.ADOConnection1.BeginTrans;
   with DM.aq607 do
   begin
    Close;
    Parameters[0].Value:='';
    Open;
    Append;
    DM.aq607.FieldByName('v_ttype').AsString:=Edit8.Text;
    dm.aq607.FieldByName('Explain').AsString:=Memo4.Text;
    dm.aq607.FieldByName('rkey73').Value:=Edit1.tag;
    Post;//增加主表
   end;
   append_608(dm.aq607v_ttype.Value);
   dm.ADOConnection1.CommitTrans;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end
 else
 begin
  dm.aq607.Close;
  dm.aq607.Parameters[0].Value:=dm.ADO607v_ttype.Value;
  dm.aq607.Open;
  try
   dm.ADOConnection1.BeginTrans;
   with dm.ADOQuery1 do
   begin
     Close;
     SQL.Clear;
     sql.Add('delete from data0608 where v_ttype='+quotedstr(dm.ADO607v_ttype.Value));
     ExecSQL;
   end;

   with dm.aq607 do
   begin
     Edit;
     dm.aq607v_ttype.Value:=Edit8.Text;
     dm.aq607Explain.Value:=Memo4.Text;
     dm.aq607.FieldByName('rkey73').Value:=Edit1.tag;
     Post;
   end;
   Self.append_608(dm.aq607v_ttype.AsString);
      dm.ADOConnection1.CommitTrans;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end;
 DM.ADO607.Close;
 DM.ADO607.Open;
end;

procedure TFrm_UnDetail.append_608(v_ttype: string);
var
  i:Integer;
begin
 with dm.ADOQuery1 do
 begin
   Close;
   sql.Clear;
   SQL.Add('select * from data0608');
   Open;
 end;
 for i:=1 to StringGrid1.RowCount-2 do
 begin
   dm.ADOQuery1.Append;
   dm.ADOQuery1.FieldByName('v_ttype').Value:=v_ttype;
   dm.ADOQuery1.FieldByName('rkey73').Value:=StrToInt(StringGrid1.Cells[0,i]);
   dm.ADOQuery1.FieldByName('seq_no').Value:=i;
   dm.ADOQuery1.Post;
 end;
end;

procedure TFrm_UnDetail.BitBtn1Enter(Sender: TObject);
begin
   if Trim(Edit8.Text)='' then
 begin
   showmsg('异常等级不能为空,请输入!',1);
   Edit8.SetFocus;
   exit;
 end;
 if Trim(Edit1.Text)='' then
 begin
   showmsg('客诉通知人员不能为空,请选择!',1);
   exit;
 end;
 if StringGrid1.RowCount=2 then
 begin
   showmsg('审批人员不能为空,请选择!',1);
   StringGrid1.SetFocus;
   exit;
 end;
end;

procedure TFrm_UnDetail.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput;
//i:Integer;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
   InputVar.Fields := 'USER_LOGIN_NAME/用户代码/250,USER_FULL_NAME/用户名称/250';
   InputVar.Sqlstr :='SELECT USER_LOGIN_NAME, USER_FULL_NAME,RKEY FROM dbo.Data0073 ';


   inputvar.KeyField:='rkey';
   InputVar.AdoConn := DM.ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
    Edit1.Text:=frmPick_Item_Single.adsPick.FieldValues['USER_FULL_NAME'];
    Edit1.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;

   end ;
  finally
   frmPick_Item_Single.Free ;
  end;
end;

end.
