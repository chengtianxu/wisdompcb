unit authorize_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, RzCmboBx, RzDBCmbo,DB,Clipbrd;



type
  TfrmAuthorize_Edit = class(TForm)
    btn_close: TBitBtn;
    btn_save: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btnBtnUnit: TSpeedButton;
    btnBtnUnit2: TSpeedButton;
    cbct_TYPE: TComboBox;
    edt_warehouse_code: TEdit;
    edt_ABBR_NAME: TEdit;
    edt_USER_LOGIN_NAME: TEdit;
    edt_USER_FULL_NAME: TEdit;
    Cbb_ttype: TComboBox;
    edt__seq_no: TEdit;
    edt_ct_area: TEdit;



    procedure btn_saveClick(Sender: TObject);
    procedure btnBtnUnit2Click(Sender: TObject);
    procedure btnBtnUnitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn_closeClick(Sender: TObject);
    procedure edt__seq_noKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ct_areaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ct_areaChange(Sender: TObject);
    procedure edt__seq_noChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbct_TYPEChange(Sender: TObject);
    procedure edt_warehouse_codeChange(Sender: TObject);
    procedure edt_USER_LOGIN_NAMEChange(Sender: TObject);
    procedure Cbb_ttypeChange(Sender: TObject);
    procedure edt_warehouse_codeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_USER_LOGIN_NAMEKeyPress(Sender: TObject; var Key: Char);
//    procedure edt_ct_areaChange(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmAuthorize_Edit: TfrmAuthorize_Edit;
  Tct_TYPE,Trkey73,TRKEY,Tttype,strS,strC :string;
  B: Boolean;

implementation

uses demo,ConstVar,Pick_Item_Single,common, main;

{$R *.dfm}





procedure TfrmAuthorize_Edit.btn_saveClick(Sender: TObject);

begin



  if Trim(cbct_TYPE.Text) = '' then
   begin
     MessageBox(Handle,'超投类型不能为空','提示',MB_ICONINFORMATION+MB_OK);
     exit;
   end
  else


  if Trim(edt_warehouse_code.Text) = '' then
     begin
       MessageBox(Handle,'工厂代码不能为空','提示',MB_ICONINFORMATION+MB_OK);
       exit;
     end

  else

  if Trim(edt_USER_LOGIN_NAME.Text) = '' then
      begin
       MessageBox(Handle,'用户代码不能为空','提示',MB_ICONINFORMATION+MB_OK);
       exit;
      end
  else

  if Trim(Cbb_ttype.Text) = '' then

      begin
       MessageBox(Handle,'产品类型不能为空','提示',MB_ICONINFORMATION+MB_OK);
       exit;
      end
  else

  if Trim(edt__seq_no.Text) = '' then

      begin
       MessageBox(Handle,'请输入审批顺序','提示',MB_ICONINFORMATION+MB_OK);
       exit;
      end
  else

  if Trim(edt_ct_area.Text) = '' then

       begin
       MessageBox(Handle,'请输入超投面积','提示',MB_ICONINFORMATION+MB_OK);
       exit;
       end
  else

  with DM.qry616 do
      begin
       Close;

       Parameters[0].value :=DM.ads616.fieldByName('ct_TYPE').AsInteger;
       Parameters[1].value :=DM.ads616.fieldByName('rkey73').AsInteger;
       Parameters[2].value :=DM.ads616.fieldByName('warehouse_ptr').AsInteger;
       Parameters[3].value :=DM.ads616.fieldByName('ttype').AsInteger;
//       Parameters.ParamByName('ct_TYPE').Value :=DM.ads616.fieldByName('ct_TYPE').AsInteger;

       Open;
      end;

  try

    if Self.Caption = '新增'  then
        dm.qry616.Append
    else
    if Self.Caption = '编辑'  then
        DM.qry616.Edit;
      with DM.qry616 do
      begin
       FieldValues['ct_TYPE'] :=cbct_TYPE.ItemIndex;
       FieldValues['warehouse_ptr'] :=edt_warehouse_code.Tag;
       FieldValues['rkey73'] :=edt_USER_LOGIN_NAME.Tag;
       FieldValues['ttype'] :=Cbb_ttype.ItemIndex;
       FieldValues['seq_no'] :=edt__seq_no.Text;
       FieldValues['ct_area'] :=edt_ct_area.Text;
       Post;   //提交数据
      end;
       with DM.qry616 do
       begin
        Tct_TYPE :=fieldByName('ct_TYPE').AsString;
        Trkey73 :=fieldByName('rkey73').AsString;
        TRKEY :=fieldByName('warehouse_ptr').AsString;
        Tttype :=fieldByName('ttype').AsString;
       end;

      Self.ModalResult := mrok;    //"Self"指本窗体
  except
    MessageBox(Handle,'保存失败，请检查记录是否重复','提示',MB_ICONINFORMATION+MB_OK);
    Abort;                   //终止
  end;

end;

procedure TfrmAuthorize_Edit.btnBtnUnit2Click(Sender: TObject);

var

  InputVar: PDlgInput;
begin


 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);



 try

    InputVar.Fields := 'USER_LOGIN_NAME/用户代码/180,USER_FULL_NAME/员工名称/180';
    InputVar.Sqlstr :='select RKEY,USER_LOGIN_NAME,USER_FULL_NAME from Data0073 where ACTIVE_FLAG = 0';
    inputvar.KeyField:='USER_LOGIN_NAME';


    InputVar.AdoConn := dm.con1;
    frmPick_Item_Single.InitForm_New(InputVar);

    frmPick_Item_Single.adsPick.Locate('rkey',edt_USER_LOGIN_NAME.Tag,[]);

  if frmPick_Item_Single.ShowModal=mrok then
   with frmPick_Item_Single.adsPick do
   begin
     edt_USER_LOGIN_NAME.Text :=fieldByName('USER_LOGIN_NAME').AsString;
     edt_USER_FULL_NAME.Text :=fieldByName('USER_FULL_NAME').AsString;
     edt_USER_LOGIN_NAME.Tag :=fieldByName('rkey').AsInteger;
   end;
 finally
    frmPick_Item_Single.Free ;
 end;

end;

procedure TfrmAuthorize_Edit.btnBtnUnitClick(Sender: TObject);
var
  InputVar: PDlgInput;
begin


 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);



 try

    InputVar.Fields := 'warehouse_code/工厂编号/175,abbr_name/工厂/175';
    InputVar.Sqlstr :='select rkey,warehouse_code,warehouse_name,warehouse_type,abbr_name from data0015';
    inputvar.KeyField:='warehouse_code';


    InputVar.AdoConn := dm.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    frmPick_Item_Single.adsPick.Locate('rkey',edt_warehouse_code.Tag,[]);

  if frmPick_Item_Single.ShowModal=mrok then
  with frmPick_Item_Single.adsPick do
   begin
     edt_warehouse_code.Text :=fieldByName('warehouse_code').AsString;
     edt_ABBR_NAME.Text :=fieldByName('abbr_name').AsString;
     edt_warehouse_code.Tag :=fieldByName('rkey').AsInteger;

   end;
 finally
    frmPick_Item_Single.Free ;
 end;
end;

procedure TfrmAuthorize_Edit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//   B :=False;
//    for i:=0 to Self.ControlCount-1 do
//    begin
////         控件: Panel1.Controls[i]   //加入自己代码
//      if (Self.Controls[i] is TComboBox) then
//      begin
//       if (TComboBox(Self.Controls[i]).Text<>'') then
//          B :=True;
//      end
//      else  if (Self.Controls[i] is TEdit) then
//      begin
//       if (TEdit(Self.Controls[i]).Text<>'') then
//          B :=True;
//      end;
//
//    end;


   if (Self.ModalResult <> mrok) and B then
        begin
          if MessageBox(Handle, '不保存退出吗?', '请确认', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
              begin
                  CanClose := true;

              end
          else
                  CanClose := false;

        end;


end;

procedure TfrmAuthorize_Edit.btn_closeClick(Sender: TObject);

begin
   Self.ModalResult := mrCancel;

end;

procedure TfrmAuthorize_Edit.edt__seq_noKeyPress(Sender: TObject;
  var Key: Char);

begin

  if not (key in ['0'..'9',#8..#27]) then key := #0;  //只允许输入数字

end;

procedure TfrmAuthorize_Edit.edt_ct_areaKeyPress(Sender: TObject;
  var Key: Char);
var
  i : Integer;
begin

//
//  if (Key = '.') and (Length(edt_ct_area.Text) > 0) then  //处理小数点
//  begin
//
//    for i := 1 to length(edt_ct_area.text) do
//    begin
//      if edt_ct_area.Text[i] = '.' then Key := #0;
//    end;
//  end
//  else
//  if not (Key in ['0'..'9',#8]) then
//  begin
//    Key := #0;  //处理非数字
//
//  end;

//    str :=StringReplace (edt_ct_area.text, '.', '', []);

   if not((TryStrToInt(edt_ct_area.text,i)) and (Key = '.')) then      //当前按下的为"."并且输入框内容能转换为整型

    begin
    if not (Key in ['0'..'9',#8..#27]) then
      begin
        Key := #0;  //处理非数字
      end;
    end;
end;
procedure TfrmAuthorize_Edit.edt_ct_areaChange(Sender: TObject);
var
  i :Integer;
  str: string;

begin

  str :=StringReplace (edt_ct_area.Text, '.', '', []);
  begin
  if (str<>'') and not(TryStrToInt(str,i)) then     //如果当前输入框字符串不能转换为整型
  begin
    edt_ct_area.Text := strC;
    edt_ct_area.SelStart := Length(edt_ct_area.Text);
  end
  else
   begin
    strC :=edt_ct_area.Text;
   end;

  end;
  B :=True;
end;

procedure TfrmAuthorize_Edit.edt__seq_noChange(Sender: TObject);
 var
   i :Integer;
begin
  if (edt__seq_no.Text<>'') and not(TryStrToInt(edt__seq_no.Text,i)) then     //如果当前输入框字符串不能转换为整型
  begin
    edt__seq_no.Text := strS;
    edt__seq_no.SelStart := Length(edt__seq_no.Text);
  end
  else
   begin
    strS :=edt__seq_no.Text;
   end;
   B :=True;
end;

procedure TfrmAuthorize_Edit.FormActivate(Sender: TObject);
begin
   B :=False;
end;

procedure TfrmAuthorize_Edit.cbct_TYPEChange(Sender: TObject);
begin
   B :=True;
end;

procedure TfrmAuthorize_Edit.edt_warehouse_codeChange(Sender: TObject);
begin
  B :=True;
end;

procedure TfrmAuthorize_Edit.edt_USER_LOGIN_NAMEChange(Sender: TObject);
begin
     B :=True;
end;

procedure TfrmAuthorize_Edit.Cbb_ttypeChange(Sender: TObject);
begin
    B :=True;
end;

procedure TfrmAuthorize_Edit.edt_warehouse_codeKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key in [#13] then
//    btnBtnUnit.Click;
    btnBtnUnit.OnClick(nil);
end;

procedure TfrmAuthorize_Edit.edt_USER_LOGIN_NAMEKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key in [#13] then
    btnBtnUnit2.OnClick(nil);
end;

end.


