unit InputUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus, ExtCtrls, ADODB, ComCtrls;

type
  TFrmInput = class(TForm)
    Label1: TLabel;
    edtWhareHouse: TEdit;
    SpeedButton1: TSpeedButton;
    lblWhareHouse: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Label4: TLabel;
    lblUnitName: TLabel;
    Label5: TLabel;
    edt_consume: TEdit;
    Shape1: TShape;
    Label8: TLabel;
    Edit1: TEdit;
    lbl1: TLabel;
    edtPJCCTS: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lvGX: TListView;
    Label2: TLabel;
    Shape3: TShape;
    Label7: TLabel;
    lvPeop: TListView;
    Shape2: TShape;
    lvCL: TListView;
    Label3: TLabel;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    Memo1: TMemo;
    Edit6: TEdit;
    Edit7: TEdit;
    Button3: TButton;
    SpeedButton2: TSpeedButton;
    SpeedButton7: TSpeedButton;
    RadioGroup1: TRadioGroup;
    SpeedButton8: TSpeedButton;
    ComboBox1: TComboBox;
    Label15: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure edtPJCCTSKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Edit2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label10MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label12MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WhareHouse_ptr,Dept_ptr,invt_ptr:Integer;
  end;

var
  FrmInput: TFrmInput;

implementation

{$R *.dfm}
uses Pick_Item_Single, ConstVar, DataModuleUnit, Frm_detailEdt_u
     ,UInv_S,Udep_S, UAdvance,common;

procedure TFrmInput.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/220,WAREHOUSE_NAME/工厂名称/220,ABBR_NAME/工厂简称/220';
    InputVar.Sqlstr :='SELECT RKEY, WAREHOUSE_CODE, WAREHOUSE_NAME, ABBR_NAME '+#13+
                      'FROM dbo.Data0015 '+#13+
                      'ORDER BY WAREHOUSE_CODE';
    inputvar.KeyField:='WAREHOUSE_CODE';
    inputvar.InPut_value:=edtWhareHouse.Text;
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtWhareHouse.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
      lblWhareHouse.Caption:=Trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME']);
      WhareHouse_ptr :=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
    end
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmInput.BitBtn1Click(Sender: TObject);
var
  i:Integer;
  QueryTmp:TADOQuery;
begin
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('请输入标准名称！');
    Exit;
  end;

  if WhareHouse_ptr = 0 then
  begin
    ShowMessage('请输入工厂！');
    Exit;
  end;
  if Trim(edtPJCCTS.Text) = '' then
  begin
    ShowMessage('请输入平均产出计算天数!');
    Exit;
  end;
  if StrToIntDef(edtPJCCTS.Text,0) <= 0 then
  begin
    ShowMessage('请输入大于0的平均产出计算天数!');
    Exit;
  end;
  if StrToIntDef(edtPJCCTS.Text,0) >=255 then
  begin
    ShowMessage('请输入小于255的平均产出计算天数!');
    Exit;
  end;
  if lvGX.Items.Count = 0 then
  begin
    ShowMessage('请输入工序！');
    Exit;
  end;
  if lvPeop.Items.Count = 0 then
  begin
    ShowMessage('请输入通知人员！');
    Exit;
  end;
  if lvCL.Items.Count = 0 then
  begin
      ShowMessage('请输入材料！');
      lblUnitName.Caption := '';
      lblUnitName.Hint := '';
      Exit;
  end;

  try
    if StrToCurr(Trim(edt_consume.Text)) <= 0 then
    begin
      ShowMessage('请输入正确的标准消耗！');
      edt_consume.SetFocus;
      edt_consume.SelectAll;
      Exit;
    end;
  except
    ShowMessage('请输入正确的标准消耗！');
    edt_consume.SetFocus;
    edt_consume.SelectAll;
    Exit;
  end;
  if ( tag = 0 ) then
  begin
        QueryTmp:=TADOQuery.Create(Self);
        QueryTmp.Connection := DM.ADOConnection1;
        with QueryTmp do
        begin
            Close;
            SQL.Clear;
            SQL.Text:='SELECT      dbo.DATA0136.rkey, dbo.DATA0136.control_name FROM   dbo.DATA0136 WHERE dbo.DATA0136.control_name='''+trim(Edit1.Text)+'''';
            Open;
            if (not IsEmpty)  then
            begin
                  ShowMessage('标准名称已被使用，请更换别的标准名称');
                  Edit1.SetFocus;
                  Edit1.SelectAll;
                  Exit;
            end;
        end;
  end;

{
  try
    if StrToInt(Trim(edtGroupId.Text)) < 0 then
    begin
      ShowMessage('请输入正确的材料组别号！');
      edtGroupId.SetFocus;
      edtGroupId.SelectAll;
    end;
  except
    ShowMessage('请输入正确的材料组别号！');
    edtGroupId.SetFocus;
    edtGroupId.SelectAll;
  end;    }

//  FrmMain.SGrid139_tmp1.ColCount:=SGrid.ColCount;
//  FrmMain.SGrid139_tmp1.RowCount:=SGrid.RowCount;
//  for i:=0 to SGrid.RowCount -1 do
//    FrmMain.SGrid139_tmp1.Rows[i]:=SGrid.Rows[i];
//
//  FrmMain.SGridInv_tmp1.ColCount:=StringGrid2.ColCount;
//  FrmMain.SGridInv_tmp1.RowCount:=StringGrid2.RowCount;
//  for i:=0 to StringGrid2.RowCount -1 do
//    FrmMain.SGridInv_tmp1.Rows[i]:=StringGrid2.Rows[i];

//  FrmMain.SGridDepz_tmp1.ColCount:=StringGrid1.ColCount;
//  FrmMain.SGridDepz_tmp1.RowCount:=StringGrid1.RowCount;
//  for i:=0 to StringGrid1.RowCount -1 do
//    FrmMain.SGridDepz_tmp1.Rows[i]:=StringGrid1.Rows[i];
  SpeedButton8Click(Sender);
  Self.ModalResult := mrOk;
end;

procedure TFrmInput.FormShow(Sender: TObject);
begin
  case Self.Tag of
    0:Self.Caption:='新增' ;
    1:Self.Caption:='编辑' ;
  end;
 PageControl1.ActivePageIndex := 0;

//  StringGrid2.Cells[0,0]:='材料编码';
//  StringGrid2.Cells[1,0]:='材料名称';
//  StringGrid2.Cells[2,0]:='rkey017';
//  StringGrid2.ColWidths[2]:=-1;
//  StringGrid2.Cells[3,0]:='库存单位';
//  StringGrid2.ColWidths[4]:=-1;

//  StringGrid1.Cells[0,0]:='工序代码';
//  StringGrid1.Cells[1,0]:='工序名称';
//  StringGrid1.Cells[2,0]:='rkey034';
//  StringGrid1.ColWidths[2]:=-1;
  //StringGrid2.Cells[3,0]:='库存单位';
end;

procedure TFrmInput.SGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
 {if button=mbright then
 begin
   SGrid.MouseToCell(x,y,column,row);
   if row<0 then SGrid.Row:=SGrid.RowCount-1
   else if row>0 then SGrid.Row:=row;
 end;   }
end;

procedure TFrmInput.N1Click(Sender: TObject);
begin
  TFrm_detailEdt.InitEdt(lvPeop,Tcomponent(Sender).Tag);
end;

procedure TFrmInput.N3Click(Sender: TObject);
begin
  lvPeop.DeleteSelected;
end;

procedure TFrmInput.MenuItem1Click(Sender: TObject);
begin
    TInv_form.InitEdt(lvCL,Tcomponent(Sender).Tag);
end;

procedure TFrmInput.MenuItem3Click(Sender: TObject);
begin
  lvCL.DeleteSelected;
end;
procedure TFrmInput.PopupMenu2Popup(Sender: TObject);
begin
    MenuItem2.Enabled:=not (lvCL.Items.Count = 0);
//    MenuItem3.Enabled:=MenuItem2.Enabled;
end;

procedure TFrmInput.PopupMenu3Popup(Sender: TObject);
begin
  MenuItem5.Enabled:=not (lvGX.Items.Count = 0);
end;

procedure TFrmInput.MenuItem6Click(Sender: TObject);
begin
  lvGX.DeleteSelected;
end;

procedure TFrmInput.MenuItem4Click(Sender: TObject);
begin
    Tdep_form.InitEdt(lvGX,Tcomponent(Sender).Tag);
end;

procedure TFrmInput.PopupMenu1Popup(Sender: TObject);
begin
  N2.Enabled := not (lvPeop.Items.Count = 0);
end;

procedure TFrmInput.edtPJCCTSKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then
    Key := #0;
end;

procedure TFrmInput.BitBtn3Click(Sender: TObject);
begin
 Adv_Form :=TAdv_Form.Create(Application);

    if Adv_Form.ShowModal = mrok then
    begin

    end;
  end;

procedure TFrmInput.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9','.',#8]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
    if (key='.') and (Pos('.',Edit2.text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TFrmInput.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9','.',#8]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
    if (key='.') and (Pos('.',Edit3.text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TFrmInput.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9','.',#8]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
    if (key='.') and (Pos('.',Edit4.text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TFrmInput.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9','.',#8]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
    if (key='.') and (Pos('.',Edit5.text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TFrmInput.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9','.',#8]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
    if (key='.') and (Pos('.',Edit6.text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TFrmInput.Memo1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
      if (source is TEdit) or (source is TLabel) then
        Accept:=true;
end;

procedure TFrmInput.Memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if (sender is TMemo) and ((source is TEdit) or (source is TLabel))then
  begin
      if  (source is TEdit) then
      memo1.SelText:=  (Source As TEdit).Text;
      if  (source is TLabel) then
      memo1.SelText:=  (Source As TLabel).Hint;
  end;
end;

procedure TFrmInput.Edit2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  (sender as TEdit).BeginDrag(false);
end;

procedure TFrmInput.Edit3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  (sender as TEdit).BeginDrag(false);
end;

procedure TFrmInput.Edit4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  (sender as TEdit).BeginDrag(false);
end;

procedure TFrmInput.Edit5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  (sender as TEdit).BeginDrag(false);
end;

procedure TFrmInput.Label6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  (sender as TLabel).BeginDrag(false);
end;

procedure TFrmInput.Label9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  (sender as TLabel).BeginDrag(false);
end;

procedure TFrmInput.Label10MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  (sender as TLabel).BeginDrag(false);
end;

procedure TFrmInput.Label12MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbleft then
  (sender as TLabel).BeginDrag(false);
end;

procedure TFrmInput.Button3Click(Sender: TObject);
var
  StrTemp: string;
  QryTemp: TADOquery;
begin
 if Trim(Memo1.Text) = '' then
    begin
        ShowMessage('公式不能为空，请检查！');
        Memo1.SetFocus;
        Abort;
    end;
    if ((POS('A',Memo1.Text)>0) or (POS('a',Memo1.Text)>0)) and (trim(Edit2.Text)='') then
    begin
        ShowMessage('公式中已经包含了损耗(A)，而损耗(A)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
        Edit2.SetFocus;
        Abort;
    end;
    if ((POS('B',Memo1.Text)>0) or (POS('b',Memo1.Text)>0)) and (trim(Edit3.Text)='') then
    begin
        ShowMessage('公式中已经包含了受镀面积(B)，而受镀面积(B)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
        Edit3.SetFocus;
        Abort;
    end;
    if ((POS('C',Memo1.Text)>0) or (POS('c',Memo1.Text)>0)) and (trim(Edit4.Text)='') then
    begin
        ShowMessage('公式中已经包含了均匀性加深度能力(C)，而均匀性加深度能力(C)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
        Edit4.SetFocus;
        Abort;
    end;
    if ((POS('D',Memo1.Text)>0) or (POS('d',Memo1.Text)>0)) and (trim(Edit5.Text)='') then
    begin
        ShowMessage('公式中已经包含了金属密度(D)，而金属密度(D)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
        Edit5.SetFocus;
        Abort;
    end;
    if ((POS('E',Memo1.Text)>0) or (POS('e',Memo1.Text)>0)) and (trim(Edit6.Text)='') then
    begin
        ShowMessage('公式中已经包含了厚度(E)，而厚度(E)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
        Edit6.SetFocus;
        Abort;
    end;

    try
        StrTemp := Memo1.Text;
        StrTemp := StringReplace(StrTemp, 'A', Edit2.Text,  [rfReplaceAll, rfIgnoreCase]);
        StrTemp := StringReplace(StrTemp, 'B', Edit3.Text,  [rfReplaceAll, rfIgnoreCase]);
        StrTemp := StringReplace(StrTemp, 'C', Edit4.Text,  [rfReplaceAll, rfIgnoreCase]);
        StrTemp := StringReplace(StrTemp, 'D', Edit5.Text,  [rfReplaceAll, rfIgnoreCase]);
        StrTemp := StringReplace(StrTemp, 'E', Edit6.Text,  [rfReplaceAll, rfIgnoreCase]);
        StrTemp := StringReplace(StrTemp, '×', '*',  [rfReplaceAll, rfIgnoreCase]);
    except
         showmessage('公式翻译出错了，请与管理员联系，谢谢。');
         Abort;
    end;

    try
        QryTemp := TADOQuery.Create(Application);
        with QryTemp do
        begin
          Connection := DM.ADOConnection1;
          Close;
          SQL.Clear;
          SQL.Text := 'select ' + StrTemp + ' as ResultNum';
          Open;
          Edit7.Text := FloatToStr(FieldValues['ResultNum']);
        end;
    except
         showmessage('公式有误，请检查修正后再试算，谢谢。');
         Abort;
    end;
  QryTemp.Free;
end;

procedure TFrmInput.SpeedButton5Click(Sender: TObject);
begin
    memo1.SelText:= '×';
end;

procedure TFrmInput.SpeedButton3Click(Sender: TObject);
begin
    memo1.SelText:= '+';
end;

procedure TFrmInput.SpeedButton4Click(Sender: TObject);
begin
    memo1.SelText:= '-';
end;

procedure TFrmInput.SpeedButton6Click(Sender: TObject);
begin
    memo1.SelText:= '/';
end;

procedure TFrmInput.SpeedButton2Click(Sender: TObject);
begin
    memo1.SelText:= '(';
end;

procedure TFrmInput.SpeedButton7Click(Sender: TObject);
begin
    memo1.SelText:= ')';
end;

procedure TFrmInput.SpeedButton8Click(Sender: TObject);
var
  StrTemp: string;
  QryTemp: TADOquery;
begin


     {   if Trim(Memo1.Text) = '' then
        begin
            ShowMessage('公式不能为空，请检查！');
            Memo1.SetFocus;
            Abort;
        end;  }
        if ((POS('A',Memo1.Text)>0) or (POS('a',Memo1.Text)>0)) and (trim(Edit2.Text)='') then
        begin
            ShowMessage('公式中已经包含了损耗(A)，而损耗(A)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
            Edit2.SetFocus;
            Abort;
        end;
        if ((POS('B',Memo1.Text)>0) or (POS('b',Memo1.Text)>0)) and (trim(Edit3.Text)='') then
        begin
            ShowMessage('公式中已经包含了受镀面积(B)，而受镀面积(B)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
            Edit3.SetFocus;
            Abort;
        end;
        if ((POS('C',Memo1.Text)>0) or (POS('c',Memo1.Text)>0)) and (trim(Edit4.Text)='') then
        begin
            ShowMessage('公式中已经包含了均匀性加深度能力(C)，而均匀性加深度能力(C)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
            Edit4.SetFocus;
            Abort;
        end;
        if ((POS('D',Memo1.Text)>0) or (POS('d',Memo1.Text)>0)) and (trim(Edit5.Text)='') then
        begin
            ShowMessage('公式中已经包含了金属密度(D)，而金属密度(D)内容为空，这样容易造成公式翻译出错，请填入相应内容，谢谢');
            Edit5.SetFocus;
            Abort;
        end;

        try
            StrTemp := Memo1.Text;
            StrTemp := StringReplace(StrTemp, 'A', Edit2.Text,  [rfReplaceAll, rfIgnoreCase]);
            StrTemp := StringReplace(StrTemp, 'B', Edit3.Text,  [rfReplaceAll, rfIgnoreCase]);
            StrTemp := StringReplace(StrTemp, 'C', Edit4.Text,  [rfReplaceAll, rfIgnoreCase]);
            StrTemp := StringReplace(StrTemp, 'D', Edit5.Text,  [rfReplaceAll, rfIgnoreCase]);
            StrTemp := StringReplace(StrTemp, '×', '*',  [rfReplaceAll, rfIgnoreCase]);
        except
             showmessage('公式翻译出错了，请与管理员联系，谢谢。');
             Abort;
        end;

        if Trim(Memo1.Text) <> '' then
        begin
            try
                QryTemp := TADOQuery.Create(Application);
                with QryTemp do
                begin
                  Connection := DM.ADOConnection1;
                  Close;
                  SQL.Clear;
                  SQL.Text := 'select ' + StrTemp + ' as ResultNum';
                  Open;
                  if   FloatToStr(FieldValues['ResultNum']) <> '' then
                  SpeedButton8.hint := FloatToStr(FieldValues['ResultNum']);
                end;
                if  TButton(Sender).Caption = '验证' then
                ShowMessage('验证通过！');
            except
                 showmessage('公式有误，请检查修正后再试算，谢谢。');
                 Abort;
            end;
        end;

      QryTemp.Free;
end;

end.

