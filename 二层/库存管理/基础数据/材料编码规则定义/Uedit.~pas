unit Uedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGridEh, Menus;

type
  TForm_edit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    DBGridEh1: TDBGridEh;
    Panel5: TPanel;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label4: TLabel;
    Edit4: TEdit;
    N2: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  gz1, gz, rkey593:Integer;
      Lsql:string;
    { Private declarations }
  public
  edit,editrkey,j, i, status: Integer;
    Frkey:integer;
    lngth1:Integer;

    { Public declarations }
  end;

var
  Form_edit: TForm_edit;

implementation

uses ConstVar, Pick_Item_Single,common,demo;

{$R *.dfm}

procedure TForm_edit.BitBtn2Click(Sender: TObject);

begin
   if Edit1.Text='' then
   begin
     ShowMessage('请输入类型代码');
     Edit1.SetFocus;
     Exit;
   end

   else
   if Edit2.Text='' then
   begin
     ShowMessage('请输入类型名称');
     Edit2.SetFocus;
     Exit;
   end;

 dm.qry596.First;
 while not DM.qry596.Eof do
 begin
    if DM.qry596.RecNo<>DM.qry596.RecordCount then
    begin
       Lsql:='select guizhe '+
       ' from data0593 '+
       ' where rkey='+dm.qry596rkey593.AsString;

       if not common.OpenQuery(dm.ADOQuery1,Lsql) then exit;

       if not dm.ADOQuery1.IsEmpty then
       begin
        if dm.ADOQuery1.FieldByName('guizhe').asinteger=1 then
        begin
        ShowMessage('请将流水加到最后一行');
        exit;
        end;
       end;
    end;
 DM.qry596.Next;
 end;
 try
   if status=0 then

   begin
      DM.save595.Close;
      DM.save595.Open;


    with DM.ADOQuery1 do
     begin
    Close;

      SQL.Text :='select * from data0595 where TYPE_CODE='''+Trim(Edit1.Text)+'''';
      Open;
     if not IsEmpty then
     begin
      ShowMessage('记录已存在!');
      Exit;
     end;
    end;
   end;

    lngth1:= 0;
    DM.qry596.First;
   begin
    while not DM.qry596.Eof do
    begin
     lngth1:= lngth1+DM.qry596length.Value;//总长度
     DM.qry596.Next;

    end;
   end ;

   dm.con1.BeginTrans;
   if status = 0 then   dm.save595.Append
   else dm.save595.Edit;

   DM.save595TYPE_CODE.Value:= Trim(Edit1.Text);
   dm.save595TYPE_NAME.Value:= Trim(Edit2.Text);
   //dm.save595LENGTH.value:= StrToInt(Trim(Edit3.Text));
   dm.save595LENGTH.value:=lngth1;
   DM.save595.post;
   dm.save595.UpdateBatch(arAll);
    Frkey:=dm.save595RKEY.Value;
 //  dm.save596.UpdateBatch(arAll);
   i:=1;
   if status=0 then
   begin

     DM.save596.First;
    while not DM.save596.Eof do
    begin
     DM.save596.Edit;
     dm.save596rec_no.Value:=i;
     DM.save596rkey595.Value:= DM.save595RKEY.Value;
     DM.save596.Post;
     i:=i+1;
     DM.save596.Next;

    end;

   end;

   dm.save596.UpdateBatch(arAll);
   dm.con1.CommitTrans;
   ModalResult:=mrok
 except
   dm.con1.RollbackTrans;
 end;

  end;





procedure TForm_edit.BitBtn1Click(Sender: TObject);
begin
  if Edit5.Text='' then
  begin
    ShowMessage('请选择编码分类!');

    Exit;
  end
  else

  if Edit6.Text='' then
  begin
    ShowMessage('请输入序号!');
    Edit6.SetFocus;
    Exit;
  end;

  if not DM.qry596.IsEmpty and (edit=0) then
  begin
    dm.qry596.Last;
  with DM.ADOQuery1 do
    begin
     Close;

      SQL.Text :='select * from data0593 where rkey='+dm.qry596rkey593.AsString;
      Open;
     if not IsEmpty then
     begin
       if FieldByName('guizhe').Value=1 then
       begin
        ShowMessage('最后一条您添加了流水,不能继续添加!');
        Exit;
       end;

     end;
    end;
  end;

  if edit=2 then
  begin
  if StrToInt(edit6.Text)<> DM.qry596.RecordCount  then
    begin
     if gz=1  then
     begin
       ShowMessage('流水只能添加最后一行');
       Exit;
     end;
    end;
  end;
  DM.qry596.Filtered:=False;
  dm.qry596.Filter:='rkey593='+inttostr(edit5.Tag)+'';
  dm.qry596.Filtered:=True;
  if not dm.qry596.IsEmpty   then
  begin
    ShowMessage('编码分类不能重复');
    dm.qry596.Filter:='';
    Exit;

  end;
  dm.qry596.Filter:='';

  if edit = 0 then
  begin
    DM.qry596.Append;
    DM.save596.Append;
  end
  else
  begin
    dm.qry596.Locate('rkey593',editrkey,[]);
    dm.save596.Locate('rkey593',editrkey,[]);
    DM.qry596.Edit;
    DM.save596.Edit;
    edit := 0;
  end;

  if status=0 then DM.qry596rkey595.Value:= 0
  else DM.qry596rkey595.Value:= DM.save595RKEY.Value;

  DM.qry596invt_ttyename.Value:=Trim(Edit5.Text);
  DM.qry596rkey593.Value:=Edit5.Tag;
  DM.qry596length.Value:= StrToInt(Trim(Edit4.Text));
  DM.qry596rec_no.Value:=StrToInt(Trim(Edit6.Text));


  DM.qry596.Post;

  if status = 0 then DM.save596rkey595.Value:=0
  else DM.save596rkey595.Value:= DM.save595RKEY.Value;
  DM.save596rkey593.Value:= Edit5.Tag;
  dm.save596rec_no.Value:= StrToInt(Trim(Edit6.Text));
  dm.save596.Post;
  Edit5.Clear;
  Edit6.Text:= IntToStr(DM.qry596.RecordCount+1);
end;

procedure TForm_edit.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput ;

begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);

  try
   InputVar.Fields := 'invt_ttyename/分类名称/300,length/长度/200';
   InputVar.Sqlstr :='select rkey,invt_ttyename, rkey593,guizhe,length  from DATA0593 where invt_ttyename like ''%'+Trim(Edit2.Text)+'%'' ' ;
   inputvar.KeyField:='rkey';
   InputVar.AdoConn := dm.con1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
     Edit4.Text:=frmPick_Item_Single.adsPick.FieldValues['length'];
     Edit4.tag:=frmPick_Item_Single.adsPick.Fieldbyname('length').AsInteger;
     Edit5.Text:=frmPick_Item_Single.adsPick.FieldValues['invt_ttyename'];
     Edit5.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
     rkey593:=frmPick_Item_Single.adsPick.Fieldbyname('rkey593').AsInteger;
     gz:=frmPick_Item_Single.adsPick.Fieldbyname('guizhe').AsInteger;
   end ;
  finally
  frmPick_Item_Single.Free ;
  end;

end;

procedure TForm_edit.N1Click(Sender: TObject);
var
  lno:Integer;
begin
 // ShowMessage(IntToStr(DM.save596.RecordCount));
  if DM.save596.Locate('rkey595;rkey593', VarArrayOf([DM.qry596rkey595.Value,DM.qry596rkey593.Value]),[]) then
  DM.save596.Delete;
  DM.qry596.Delete;
  Edit6.Text:= IntToStr(DM.qry596.RecordCount+1);
end;

procedure TForm_edit.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9',#13,#8]) then
 key:=#0;
end;

procedure TForm_edit.FormCreate(Sender: TObject);
begin
 // j:=1;
end;

procedure TForm_edit.PopupMenu1Popup(Sender: TObject);
begin
  if DM.qry596.IsEmpty then
  begin
    N1.Enabled:=False;
    N2.Enabled:=False;
  end
  else
  N1.Enabled:=True;
  N1.Enabled:=True;
  if DM.qry596.RecNo<>DM.qry596.RecordCount then
  begin

    N1.Enabled:=False;
   end
   else
    N1.Enabled:=True;




end;

procedure TForm_edit.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
    ShowMessage(dm.qry596.SQL.Text);
end;

procedure TForm_edit.DBGridEh1CellClick(Column: TColumnEh);
begin
  if not dm.qry596.Eof then
 begin
   N1.Enabled:=False;
 end
 else
 N1.Enabled:=True;
end;

procedure TForm_edit.N2Click(Sender: TObject);
begin
    editrkey:=dm.qry596rkey593.Value;;
    edit:= 2;
    Edit5.Text:=dm.qry596invt_ttyename.Value;
    Edit5.Tag:=dm.qry596rkey593.Value;
    Edit4.Text:=IntToStr(dm.qry596length.Value);
    Edit6.Text:=IntToStr(DM.qry596rec_no.Value);
    edit5.Color:=clLime;
end;

procedure TForm_edit.FormShow(Sender: TObject);
begin
Edit6.Text:= IntToStr(DM.qry596.RecordCount+1);
end;

end.
