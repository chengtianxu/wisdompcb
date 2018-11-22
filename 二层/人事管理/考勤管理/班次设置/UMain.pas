unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Menus, DBGridEh, Buttons, ComCtrls,
  Mask, DBCtrls, DBCtrlsEh, ExtCtrls,StrUtils,USpecial;

type
  TMain_Form = class(TForm)
    dgh_ruler: TDBGridEh;
    grb_base: TGroupBox;
    chk_active: TCheckBox;
    lb_bc: TLabel;
    lb_t1: TLabel;
    lb_to1: TLabel;
    CheckBox3: TCheckBox;
    lb_effect: TLabel;
    edt_sb: TEdit;
    lb_effect1: TLabel;
    edt_xb: TEdit;
    lb_effect2: TLabel;
    edt_space: TEdit;
    lb_effect3: TLabel;
    lb_other: TLabel;
    lb_total: TLabel;
    cbb_type: TComboBox;
    lb_type: TLabel;
    lb_desc: TLabel;
    bbt_out: TBitBtn;
    btn_special: TButton;
    Panel1: TPanel;
    bbt_exit: TBitBtn;
    bbt_add: TBitBtn;
    bbt_del: TBitBtn;
    bbt_mod: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label6: TLabel;
    Edit3: TEdit;
    CheckBox6: TCheckBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    chk_1: TCheckBox;
    chk_2: TCheckBox;
    lb_1: TLabel;
    Edit4: TEdit;
    medt1: TMaskEdit;
    medt2: TMaskEdit;
    medt3: TMaskEdit;
    medt4: TMaskEdit;
    medt5: TMaskEdit;
    medt6: TMaskEdit;
    lb_2: TLabel;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    lb_3: TLabel;
    edt_1: TEdit;
    edt_2: TEdit;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn1: TBitBtn;
    btn1: TBitBtn;
    dbgrdh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure bbt_exitClick(Sender: TObject);
    procedure bbt_outClick(Sender: TObject);
    procedure pnl_display(flag:Boolean);
    procedure bbt_addClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure bbt_delClick(Sender: TObject);
    procedure bbt_modClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure medt1Exit(Sender: TObject);
    procedure medt1KeyPress(Sender: TObject; var Key: Char);
    procedure medt2Exit(Sender: TObject);
    procedure medt2KeyPress(Sender: TObject; var Key: Char);
    procedure bbt_2Click(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure dgh_rulerColExit(Sender: TObject);
    procedure btn_specialClick(Sender: TObject);
    procedure medt3Exit(Sender: TObject);
    procedure medt4Exit(Sender: TObject);
    procedure medt5Exit(Sender: TObject);
    procedure medt6Exit(Sender: TObject);
    procedure Calculate1(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure dgh_rulerTitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure medt3KeyPress(Sender: TObject; var Key: Char);
    procedure medt4KeyPress(Sender: TObject; var Key: Char);
    procedure medt5KeyPress(Sender: TObject; var Key: Char);
    procedure medt6KeyPress(Sender: TObject; var Key: Char);
    procedure edt_1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
  private
    FTag : Integer;
    PreColumn: TColumnEh;
    field_name:string;
    tmpfloat1,tmpfloat2 : Double;
    changeflag1 : Boolean;
    str1, str2: string;
    { Private declarations }
  public
    Specialreal : array[1..16] of Double;
    Specialbit : array[1..18] of Boolean;
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses UDM, common;

{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);

begin

 //
 {  }
 if not App_Init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title; 
  //

  {  dm.ADOConnection1.Open;
  rkey73:= '96';
  user_ptr := '110';
  vprev := '4';   }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  field_name := dgh_ruler.Columns[0].FieldName;
  PreColumn := dgh_ruler.Columns[0];
  dgh_ruler.Columns[0].Title.Color := clred ;
end;

procedure TMain_Form.FormShow(Sender: TObject);
begin
  ///初始化控件
  dm.qry1.Close;
  dm.qry1.Open;
  dm.qry1.First;
  dm.qry_ruler.close;
  dm.qry_ruler.open;
  while not dm.qry1.Eof do
  begin
    cbb_type.Items.Add(dm.qry1.FieldValues['item']);
    dm.qry1.Next;
  end;
  cbb_type.ItemIndex := 0;
  grb_base.Visible := False;
  dgh_ruler.Height := dgh_ruler.Height + grb_base.Height;
  dgh_rulerTitleClick(dgh_ruler.Columns[0]);
end;

procedure TMain_Form.bbt_exitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMain_Form.pnl_display(flag:Boolean); //输入当前状态，用来控制pnl_base的显示
begin
  grb_base.visible:=not grb_base.visible;
  if flag then
    begin
      dgh_ruler.height:=dgh_ruler.Height+grb_base.Height;
    end
  else
    begin
      dgh_ruler.Height:=dgh_ruler.Height-grb_base.Height;
      grb_base.Top:=dgh_ruler.Top+dgh_ruler.Height;
    end;
end;

procedure TMain_Form.bbt_outClick(Sender: TObject);
begin
  pnl_display(grb_base.Visible);
  bbt_mod.Enabled := False;
end;

procedure TMain_Form.bbt_addClick(Sender: TObject);
var
  i, j: Integer;
begin

  if ((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  bbt_mod.Enabled := False;
  bbt_del.Enabled := False;

  for i :=0 to ComponentCount - 1 do
  begin
  if Self.Components[i] is TMaskEdit then
  begin
    TMaskEdit(Components[i]).Enabled := True;
    TMaskEdit(Components[i]).Text := '__:__';
  end;

  if Self.Components[i] is TEdit then
  begin
    TEdit(Components[i]).Enabled := True;
    TEdit(Components[i]).Text := '';
  end;

  if Self.Components[i] is TCheckBox then
  begin
    TCheckBox(Components[i]).Enabled := True;
    TCheckBox(Components[i]).Checked := False;
  end;

  if Self.Components[i] is TComboBox then
  begin
    TComboBox(Components[i]).Enabled := True;
    TComboBox(Components[i]).ItemIndex := 0;
  end;

  end;
  //showmessage('类型定义成功');
  bbt_1.Enabled := True;
  bbt_2.Enabled := True;
  btn_special.Enabled := True;
  edt_1.Focused;

  if grb_base.Visible
  then dm.qry_ruler.Cancel
  else
  pnl_display(grb_base.Visible);

   //showmessage('显示成功');

  FTag := 0;
  Edit1.Enabled := False;

  for j := 1  to 16 do
  begin
    Specialreal[j] := 0.00;
  end;
    for j := 1  to 18 do
  begin
    Specialbit[j] := False;
  end;

  chk_active.Checked := True;
  
  Edit1.Text := '';

end;

procedure TMain_Form.btn_saveClick(Sender: TObject);
begin
  if  Trim(edt_1.Text) = '' then ShowMessage('班次不能为空，保存失败！')
  else
  begin
    if (medt1.Text = '  :  ') or (medt2.Text = '  :  ') then
    begin
      ShowMessage('时段1不能为空，保存失败！');
    end
    else
    begin
      dm.qry_ruler.FieldByName('classname').Value := edt_1.Text;
      dm.qry_ruler.FieldByName('classdesc').Value := edt_2.Text;
      if (StringReplace(medt1.Text,':',' ',[])) > (StringReplace(medt2.Text,':',' ',[])) then
        dm.qry_ruler.FieldByName('outtime1').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-02 '+medt2.Text+':00'))
      else
        dm.qry_ruler.FieldByName('outtime1').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt2.Text+':00'));
      dm.qry_ruler.FieldByName('ontime1').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt1.Text+':00'));
      if medt3.Text <> '  :  ' then
        dm.qry_ruler.FieldByName('ontime2').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt3.Text+':00'));
      if medt4.Text <> '  :  ' then
        dm.qry_ruler.FieldByName('outtime2').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt4.Text+':00'));
      if medt5.Text <> '  :  ' then
        dm.qry_ruler.FieldByName('ontime3').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt5.Text+':00'));
      if medt6.Text <> '  :  ' then
        dm.qry_ruler.FieldByName('outtime3').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt6.Text+':00'));

      dm.qry_ruler.FieldByName('aheadduty').Value := StrToInt(edt_sb.Text);
      dm.qry_ruler.FieldByName('delayduty').Value := StrToInt(edt_xb.Text);
      dm.qry_ruler.FieldByName('cardGap').Value := StrToInt(edt_space.Text);

      if CheckBox1.Checked then dm.qry_ruler.FieldByName('isextra1').Value := 1
      else dm.qry_ruler.FieldByName('isextra1').Value := 0;
      if CheckBox2.Checked then dm.qry_ruler.FieldByName('isextra2').Value := 1
      else dm.qry_ruler.FieldByName('isextra2').Value := 0;
      if CheckBox3.Checked then dm.qry_ruler.FieldByName('isextra3').Value := 1
      else dm.qry_ruler.FieldByName('isextra3').Value := 0;
      
      if (chk_1.Checked = False) and (chk_2.Checked =False) then
        dm.qry_ruler.FieldByName('passsegment').Value := 0; //无直通
      if chk_1.Checked then
        dm.qry_ruler.FieldByName('passsegment').Value := 1; //中午直通
      if chk_2.Checked then
        dm.qry_ruler.FieldByName('passsegment').Value := 2; //下午直通
      if chk_1.Checked and chk_2.Checked then
        dm.qry_ruler.FieldByName('passsegment').Value := 3; //全部直通

      if cbb_type.ItemIndex = 0 then
        dm.qry_ruler.FieldByName('overtimetype').Value := 80;  //平时加班
      if cbb_type.ItemIndex = 1 then
        dm.qry_ruler.FieldByName('overtimetype').Value := 81;  //周末加班
      if cbb_type.ItemIndex = 2 then
        dm.qry_ruler.FieldByName('overtimetype').Value := 82;  //节假日加班

      dm.qry_ruler.FieldByName('work_rest').Value := StrToFloat(Edit2.Text);
      dm.qry_ruler.FieldByName('overwork_rest').Value := StrToFloat(Edit3.Text);
      dm.qry_ruler.FieldByName('worktimesum').Value := StrToFloat(Edit1.Text);
      dm.qry_ruler.FieldByName('overworktime').Value := StrToFloat(Edit4.Text);
      DM.qry_ruler.Post;
    end;
  end;
end;

procedure TMain_Form.btn_cancelClick(Sender: TObject);
begin
  DM.qry_ruler.Cancel;
end;

procedure TMain_Form.bbt_delClick(Sender: TObject);
var
  classrkey, i: Integer;
begin
  if ((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  if not dm.qry_ruler.Eof then
    begin
      if MessageDlg('你确定要删除该班次记录吗?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
        classrkey := DM.qry_ruler.FieldValues['rkey'];
        DM.qryClass.Close;
        DM.qryClass.SQL.Clear;
        DM.qryClass.SQL.Text :=Format('select a.rkey,a.classname,b.rkey,b.classgroupcode,b.classbunch from class a join classgroup b '
          + 'on charindex(('',''+cast(a.rkey as nvarchar(20))+'',''),('',''+b.classbunch+'',''),1)<>0 '
          + 'and a.rkey=%d ', [classrkey]);
        DM.qryClass.Open;
        if  DM.qryClass.RecordCount > 0 then
        begin
          Application.MessageBox('该班次已存在于班组中，无法删除！','提示', 64);
          Exit;
        end;
        DM.qry2.Close;
        DM.qry2.SQL.Clear;
        DM.qry2.SQL.Text := Format('select * from  dbo.OnOffDutyData, dbo.class '
          + 'where OnOffDutyData.ClassID=class.Rkey and '
          + 'datediff(day,OnOffDutyData.CheckDate,getdate())>(365*2) '
          + 'and class.rkey=%d ', [classrkey]);
        DM.qry2.Open;
        if not DM.qry2.IsEmpty then
        begin
          Application.MessageBox('该班次存在与考勤档案中，无法删除！','提示', 64);
          Exit;
        end;
        DM.qry_ruler.Delete;
        dm.qry_ruler.UpdateBatch;
        for i :=0 to ComponentCount - 1 do
        begin
          if Self.Components[i] is TMaskEdit then
           TEdit(Components[i]).Text := '  :  ';
          if Self.Components[i] is TEdit then
           TEdit(Components[i]).Text := '';
        end;
      end;
    end
  else Application.MessageBox('当前记录为空','提示', 64);
end;

procedure TMain_Form.bbt_modClick(Sender: TObject);
var
  i: Integer;
begin
    if ((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  for i :=0 to ComponentCount - 1 do
  begin
   if Self.Components[i] is TMaskEdit then
     TEdit(Components[i]).Enabled := True;
   if Self.Components[i] is TEdit then
     TEdit(Components[i]).Enabled := True;
   if Self.Components[i] is TCheckBox then
     TCheckBox(Components[i]).Enabled := True;
   if Self.Components[i] is TComboBox then
     TComboBox(Components[i]).Enabled := True;
  end;
  bbt_1.Enabled := True;
  bbt_2.Enabled := True;
  btn_special.Enabled := True;
  FTag := 1;
  if not CheckBox6.Checked then
  Edit1.Enabled := False;
  Edit4.Enabled := False;
end;

procedure TMain_Form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
  if (key='.') and (Pos('.',(Sender as TEdit).Text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TMain_Form.Edit1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  Handled := true;
end;

procedure TMain_Form.medt1Exit(Sender: TObject);
var
  Count:Integer;
  tmpstr1 : string;
begin
  if  (medt1.Text <> '  :  ') then
  begin
    tmpstr1 := medt1.Text;
    for Count:=1 to Length(tmpstr1) do
    begin
      If (tmpstr1[Count]=' ')  Then
        tmpstr1[Count] := '0';
    end;
    medt1.Text := tmpstr1;

    if (StrToTimeDef(medt1.Text,0) = 0) and (medt1.Text <> '00:00')   then
    begin
      showmessage('您输入的时间格式错误,请重新输入');
      medt1.SetFocus;
      abort;
    end;
  end;
  Self.Calculate1(Sender);
end;

procedure TMain_Form.medt1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then medt1.SetFocus ;
    changeflag1 := False;
end;

procedure TMain_Form.medt2Exit(Sender: TObject);
var
  Count:Integer;
  tmpstr1 : string;
begin
  if  (medt2.Text <> '  :  ') then
  begin
    tmpstr1 := medt2.Text;
    for Count:=1 to Length(tmpstr1) do
    begin
      If (tmpstr1[Count]=' ')  Then
        tmpstr1[Count] := '0';
    end;
    medt2.Text := tmpstr1;

    if (StrToTimeDef(medt2.Text,0) = 0) and (medt2.Text <> '00:00')   then
    begin
      showmessage('您输入的时间格式错误,请重新输入');
      medt2.SetFocus;
      abort;
    end;
  end;
  Self.Calculate1(Sender);
end;

procedure TMain_Form.medt2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then medt2.SetFocus ;
    changeflag1 := False;
end;

procedure TMain_Form.bbt_2Click(Sender: TObject);
begin
  DM.qry_ruler.Cancel;
  Self.dgh_rulerColExit(Sender);
end;

procedure TMain_Form.bbt_1Click(Sender: TObject);
var
  i, j: Integer;
begin
  if Trim(edt_1.Text) = '' then ShowMessage('班次不能为空，保存失败！')
  else
  begin
    if (medt1.Text = '  :  ') or (medt2.Text = '  :  ') then
      begin
        ShowMessage('时段1不能为空，保存失败！');
      end
    else
    begin
      if DM.ADOConnection1.Connected then
      begin
        try
          if FTag = 0 then DM.qry_ruler.Append
          else DM.qry_ruler.Edit;
          if ((medt3.text ='  :  ') and (medt4.text <> '  :  ')) or ((medt4.text ='  :  ') and (medt3.text <> '  :  ')) then
          begin
            showmessage('时段2的起始时间和结束时间不能只输入一项！');
            Exit;
          end;

          if ((medt5.text ='  :  ') and (medt6.text <> '  :  ')) or ((medt6.text ='  :  ') and (medt5.text <> '  :  ')) then
          begin
            showmessage('时段3的起始时间和结束时间不能只输入一项！');
            Exit;
          end;
          dm.qry_ruler.FieldByName('classname').Value := edt_1.Text;
          dm.qry_ruler.FieldByName('classdesc').Value := edt_2.Text;
          if (StringReplace(medt1.Text,':',' ',[])) > (StringReplace(medt2.Text,':',' ',[])) then
            dm.qry_ruler.FieldByName('outtime1').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-02 '+medt2.Text+':00'))
          else
            dm.qry_ruler.FieldByName('outtime1').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt2.Text+':00'));
          dm.qry_ruler.FieldByName('ontime1').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt1.Text+':00'));
          if medt3.Text <> '  :  ' then
            dm.qry_ruler.FieldByName('ontime2').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt3.Text+':00'));
          if medt4.Text <> '  :  ' then
            dm.qry_ruler.FieldByName('outtime2').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt4.Text+':00'));
          if medt5.Text <> '  :  ' then
            dm.qry_ruler.FieldByName('ontime3').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt5.Text+':00'));
          if medt6.Text <> '  :  ' then
            dm.qry_ruler.FieldByName('outtime3').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss',StrToDateTime('1900-01-01 '+medt6.Text+':00'));

          if (medt3.Text = '  :  ') and (medt4.Text = '  :  ') then
          begin
            dm.qry_ruler.FieldByName('ontime2').Value := null;
            dm.qry_ruler.FieldByName('outtime2').Value :=null;
          end;
          if (medt5.Text = '  :  ') and (medt6.Text = '  :  ') then
          begin
            dm.qry_ruler.FieldByName('ontime3').Value := null;
            dm.qry_ruler.FieldByName('outtime3').Value :=null;
          end;
          if edt_sb.Text <> '' then
            dm.qry_ruler.FieldByName('aheadduty').Value := StrToInt(edt_sb.Text);
          if edt_xb.Text <> '' then
            dm.qry_ruler.FieldByName('delayduty').Value := StrToInt(edt_xb.Text);
          if edt_space.Text <> '' then
            dm.qry_ruler.FieldByName('cardGap').Value := StrToInt(edt_space.Text);

          if CheckBox1.Checked then dm.qry_ruler.FieldByName('isextra1').Value := 1
          else dm.qry_ruler.FieldByName('isextra1').Value := 0;
          if CheckBox2.Checked then dm.qry_ruler.FieldByName('isextra2').Value := 1
          else dm.qry_ruler.FieldByName('isextra2').Value := 0;
          if CheckBox3.Checked then dm.qry_ruler.FieldByName('isextra3').Value := 1
          else dm.qry_ruler.FieldByName('isextra3').Value := 0;
          if CheckBox6.Checked then DM.qry_ruler.FieldByName('auto_overtime').Value := 1
          else DM.qry_ruler.FieldByName('auto_overtime').Value := 0;
          if (chk_1.Checked = False) and (chk_2.Checked =False) then
            dm.qry_ruler.FieldByName('passsegment').Value := 0; //无直通
          if chk_1.Checked then
            dm.qry_ruler.FieldByName('passsegment').Value := 1; //中午直通
          if chk_2.Checked then
            dm.qry_ruler.FieldByName('passsegment').Value := 2; //下午直通
          if chk_1.Checked and chk_2.Checked then
            dm.qry_ruler.FieldByName('passsegment').Value := 3; //全部直通

          if cbb_type.ItemIndex = 0 then
            dm.qry_ruler.FieldByName('overtimetype').Value := 80;  //平时加班
          if cbb_type.ItemIndex = 1 then
            dm.qry_ruler.FieldByName('overtimetype').Value := 81;  //周末加班
          if cbb_type.ItemIndex = 2 then
            dm.qry_ruler.FieldByName('overtimetype').Value := 82;  //节假日加班
          //1为有效，0为无效
          if chk_active.Checked then
            dm.qry_ruler.FieldByName('classstatus').Value := 1
          else
            dm.qry_ruler.FieldByName('classstatus').Value := 0;
          if Edit2.Text <> '' then
          dm.qry_ruler.FieldByName('work_rest').Value := StrToFloat(Edit2.Text);
          if Edit3.Text <> '' then
          dm.qry_ruler.FieldByName('overwork_rest').Value := StrToFloat(Edit3.Text);
          if Edit1.Text <> '' then
          dm.qry_ruler.FieldByName('worktimesum').Value := StrToFloat(Edit1.Text);
           if Edit4.Text <> '' then
          dm.qry_ruler.FieldByName('overworktime').Value := StrToFloat(Edit4.Text);
          for j := 1  to 18 do
          begin
            if j <> 18 then
              DM.qry_ruler.FieldByName('edit_'+inttostr(j+16)).Value := Specialbit[j]
            else
              DM.qry_ruler.FieldByName('isoverzero').Value := Specialbit[18]; //夜班标识 specialbit[18]
             //
             if j<=16 then  DM.qry_ruler.FieldByName('edit_'+inttostr(j)).Value := Specialreal[j];//无实数edit17
          end;
          DM.qry_ruler.Post;
        except
          DM.ADOConnection1.RollbackTrans;
          showmessage('保存数据失败...');
        end;
      end;

      for i :=0 to ComponentCount - 1 do
      begin
        if Self.Components[i] is TMaskEdit then
         TEdit(Components[i]).Enabled := False;
        if Self.Components[i] is TEdit then
         TEdit(Components[i]).Enabled := False;
        if Self.Components[i] is TCheckBox then
         TCheckBox(Components[i]).Enabled := False;
        if Self.Components[i] is TComboBox then
         TComboBox(Components[i]).Enabled := False;
      end;
      bbt_1.Enabled := false;
      bbt_2.Enabled := false;
      btn_special.Enabled := False;
    end;
  end;
  BitBtn1Click(nil);
end;


procedure TMain_Form.dgh_rulerColExit(Sender: TObject);
var
  i,j: Integer;
begin
  bbt_mod.Enabled := True;
  bbt_del.Enabled := True;

  for i :=0 to ComponentCount - 1 do
  begin
   if Self.Components[i] is TMaskEdit then
     TEdit(Components[i]).Enabled := False;
   if Self.Components[i] is TEdit then
     TEdit(Components[i]).Enabled := False;
   if Self.Components[i] is TCheckBox then
     TCheckBox(Components[i]).Enabled := False;
   if Self.Components[i] is TComboBox then
     TComboBox(Components[i]).Enabled := False;
    bbt_1.Enabled := false;
    bbt_2.Enabled := false;
    btn_special.Enabled := False;
  end;
//
  if DM.qry_ruler.FieldByName('classname').AsString = '' then
  begin
    ShowMessage('该行记录为空！');
    DM.qry_ruler.Last;
  end
  else
  begin
    if not grb_base.Visible then
    begin
     pnl_display(grb_base.Visible);
    end;

    if  DM.qry_ruler.FieldByName('ontime1').isnull then medt1.Text := '00:00'
    else medt1.Text :=Copy(formatdatetime('YYYY-MM-DD HH:mm:ss',DM.qry_ruler.FieldValues['ontime1']),12,5);

    if  DM.qry_ruler.FieldByName('outtime1').isnull  then medt2.Text := '00:00'
    else medt2.Text :=Copy(formatdatetime('YYYY-MM-DD HH:mm:ss',DM.qry_ruler.FieldValues['outtime1']),12,5);

    if not DM.qry_ruler.FieldByName('ontime2').IsNull then
       medt3.Text :=Copy(formatdatetime('YYYY-MM-DD HH:mm:ss',DM.qry_ruler.FieldValues['ontime2']),12,5)
    else medt3.Text := '';

    if not DM.qry_ruler.FieldByName('outtime2').IsNull then
         medt4.Text :=Copy(formatdatetime('YYYY-MM-DD HH:mm:ss',DM.qry_ruler.FieldValues['outtime2']),12,5)
    else medt4.Text := '';

    if not DM.qry_ruler.FieldByName('ontime3').IsNull then
          medt5.Text :=Copy(formatdatetime('YYYY-MM-DD HH:mm:ss',DM.qry_ruler.FieldValues['ontime3']),12,5)
    else medt5.Text := '';

    if not DM.qry_ruler.FieldByName('outtime3').IsNull then
         medt6.Text :=Copy(formatdatetime('YYYY-MM-DD HH:mm:ss',DM.qry_ruler.FieldValues['outtime3']),12,5)
    else medt6.Text := ''; 
           //             showmessage(medt1.Text);
            //             showmessage(medt2.Text);
            //                 showmessage(medt3.Text);
           //              showmessage(medt4.Text);
           //             showmessage(medt5.Text);
           //             showmessage(medt6.Text); 
    //加班类型(80平常加班，81周末加班，82节假日加班)
    if DM.qry_ruler.FieldByName('overtimetype').Value = 80 then
      cbb_type.ItemIndex := 0;

    if DM.qry_ruler.FieldByName('overtimetype').Value = 81 then
      cbb_type.ItemIndex := 1;

    if DM.qry_ruler.FieldByName('overtimetype').Value = 82 then
      cbb_type.ItemIndex := 2;

    //0无直落，1中午直落，2下午直落，3全部直落
    if DM.qry_ruler.FieldByName('passsegment').Value = 0 then
    begin
      chk_1.Checked := False;
      chk_2.Checked := False;
    end;
    if DM.qry_ruler.FieldByName('passsegment').Value = 3 then
    begin
      chk_1.Checked := True;
      chk_2.Checked := True;
    end
    else
    begin
      if DM.qry_ruler.FieldByName('passsegment').Value = 1 then
       chk_1.Checked := True
      else
       chk_1.Checked := False;
      if DM.qry_ruler.FieldByName('passsegment').Value = 2 then
       chk_2.Checked := True
      else
       chk_2.Checked := False;
    end;

    //True(1)加班，False(0)正班
    if dm.qry_ruler.FieldByName('isextra1').Value = 'True' then CheckBox1.Checked := True
    else CheckBox1.Checked := False;
    if dm.qry_ruler.FieldByName('isextra2').Value = 'True' then CheckBox2.Checked := True
    else CheckBox2.Checked := False;
    if dm.qry_ruler.FieldByName('isextra3').Value = 'True' then CheckBox3.Checked := True
    else CheckBox3.Checked := False;

    //超过正班时间自动计为加班，1为有效，0为无效
    if  dm.qry_ruler.FieldByName('auto_overtime').Value = 1
    then CheckBox6.Checked := True
    else CheckBox6.Checked := False;
    //1为有效班次，0为无效班次
    if DM.qry_ruler.FieldByName('classstatus').Value = 1 then chk_active.Checked := True
    else chk_active.Checked := False;

    edt_1.Text := DM.qry_ruler.FieldValues['classname'];
    edt_2.Text := DM.qry_ruler.FieldValues['classdesc'];
    edt_sb.Text := DM.qry_ruler.FieldValues['aheadduty'];
    edt_xb.Text := DM.qry_ruler.FieldValues['delayduty'];
    edt_space.Text := DM.qry_ruler.FieldValues['cardGap'];
    Edit2.Text := DM.qry_ruler.FieldValues['work_rest'];
    Edit3.Text := DM.qry_ruler.FieldValues['overwork_rest'];

    Edit1.Text := formatfloat('0.00',DM.qry_ruler.FieldValues['worktimesum']);
    Edit4.Text := formatfloat('0.00',DM.qry_ruler.FieldValues['overworktime']);

    for j := 1  to 16 do
    begin
      Specialreal[j] := dm.qry_ruler.FieldByName('edit_'+inttostr(j)).Value;

      Specialbit[j] :=  DM.qry_ruler.FieldByName('edit_'+inttostr(j+16)).Value;

    end;

      Specialbit[17] :=  DM.qry_ruler.FieldByName('edit_'+inttostr(33)).Value;
      Specialbit[18] :=  DM.qry_ruler.FieldByName('isoverzero').Value;
  end;
  changeflag1 := False;
  Edit1.Enabled := False;


end;

procedure TMain_Form.btn_specialClick(Sender: TObject);
begin
  with TSpecial_Form.Create(nil) do
  try
    SubFtag := FTag;
    initd;
    if showmodal=mrok then
    begin

    end;
  finally
    free;
    //showmessage('关闭');
    Calculate1(Sender);
  end;
end;

procedure TMain_Form.medt3Exit(Sender: TObject);
var
  Count:Integer;
  tmpstr1 : string;
begin
  if  (medt3.Text <> '  :  ') then
  begin
    tmpstr1 := medt3.Text;
    for Count:=1 to Length(tmpstr1) do
    begin
      If (tmpstr1[Count]=' ')  Then
        tmpstr1[Count] := '0';
    end;
    medt3.Text := tmpstr1;
    if (StrToTimeDef(medt3.Text,0) = 0) and (medt3.Text <> '00:00')   then
    begin
      showmessage('您输入的时间格式错误,请重新输入');
      medt3.SetFocus;
      abort;
    end;
  end;
  Self.Calculate1(Sender);
end;

procedure TMain_Form.medt4Exit(Sender: TObject);
var
  Count:Integer;
  tmpstr1 : string;
begin
  if  (medt4.Text <> '  :  ') then
  begin
    tmpstr1 := medt4.Text;
    for Count:=1 to Length(tmpstr1) do
    begin
      If (tmpstr1[Count]=' ')  Then
        tmpstr1[Count] := '0';
    end;
    medt4.Text := tmpstr1;
    if (StrToTimeDef(medt4.Text,0) = 0) and (medt4.Text <> '00:00')  then
    begin
      showmessage('您输入的时间格式错误,请重新输入');
      medt4.SetFocus;
      abort;
    end;
  end;
  Self.Calculate1(Sender);
end;

procedure TMain_Form.medt5Exit(Sender: TObject);
var
  Count:Integer;
  tmpstr1 : string;
begin
  if  (medt5.Text <> '  :  ') then
  begin
     tmpstr1 := medt5.Text;
    for Count:=1 to Length(tmpstr1) do
    begin
      If (tmpstr1[Count]=' ')  Then
      tmpstr1[Count] := '0';
    end;
    medt5.Text := tmpstr1;
    if (StrToTimeDef(medt5.Text,0) = 0) and (medt5.Text <> '00:00')   then
    begin
      showmessage('您输入的时间格式错误,请重新输入');
      medt5.SetFocus;
      abort;
    end;
  end;
  Self.Calculate1(Sender);
end;

procedure TMain_Form.medt6Exit(Sender: TObject);
var
  Count:Integer;
  tmpstr1 : string;
begin
  if  (medt6.Text <> '  :  ') then
  begin
    tmpstr1 := medt6.Text;
    for Count:=1 to Length(tmpstr1) do
    begin
      If (tmpstr1[Count]=' ')  Then
      tmpstr1[Count] := '0';
    end;
    medt6.Text := tmpstr1;
    if (StrToTimeDef(medt6.Text,0) = 0) and (medt6.Text <> '00:00') and (medt6.Text <> '  :  ')   then
    begin
      showmessage('您输入的时间格式错误,请重新输入');
      medt6.SetFocus;
      abort;
    end;
  end;
  Self.Calculate1(Sender);
end;

procedure TMain_Form.Calculate1(Sender: TObject);
var
  Count:Integer;
  tmpstr1,tmpstr2 : string;
  tmptime1,tmptime2 : TTime;
  tmpfloat1,tmpfloat2,tmpint1,tmpint2,zhiluo1,zhiluo2,
  work_rest,overwork_rest : Single;

begin
  //  此计算可能存在好多BUG

            tmptime1 :=  strtotime('00:00:00');
            tmptime2 :=  strtotime('00:00:00');
            tmpfloat1 := 0.00;
            tmpfloat2 := 0.00;
            tmpint1 := 0.00;
            tmpint2 := 0.00;
            zhiluo1 := Specialreal[15]/60.00;
            zhiluo2 := Specialreal[16]/60.00;
            work_rest :=0.00;
            overwork_rest := 0.00;
            if edit2.Text <>''
            then  work_rest := StrToFloat(edit2.Text)/60.00;
            if edit3.Text <>''
            then  overwork_rest := StrToFloat(edit3.Text)/60.00;

            // 修正短时间
            {if (medt1.Text <> '  :  ') then medt1.Text :=medt1.Text+':00';
            if (medt2.Text <> '  :  ') then medt2.Text :=medt2.Text+':00' ;
            if (medt3.Text <> '  :  ') then medt3.Text :=medt3.Text+':00' ;
            if (medt4.Text <> '  :  ') then medt4.Text :=medt4.Text+':00' ;
            if (medt5.Text <> '  :  ') then medt5.Text :=medt5.Text+':00' ;
            if (medt6.Text <> '  :  ') then medt6.Text :=medt6.Text+':00' ;
            }
            if (medt1.Text <> '  :  ') and (medt2.Text <> '  :  ') then
            begin
                    //showmessage(medt2.Text);
                    if  strtotime(medt2.Text) <  strtotime(medt1.Text) then
                    begin
                          tmptime1 := tmptime1 + (((strtotime('12:00') + strtotime(medt2.Text)) - (strtotime(medt1.Text) - strtotime('12:00'))));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 := StrToFloat(tmpstr1);
                    end else
                    begin
                          tmptime1 :=  tmptime1 +  (strtotime(medt2.Text)) -  (strtotime(medt1.Text));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 := StrToFloat(tmpstr1);
                    end;
            end;
            if (medt3.Text <> '  :  ') and (medt4.Text <> '  :  ') then
            begin
                    if  strtotime(medt4.Text) <  strtotime(medt3.Text) then
                    begin
                          tmptime1 := tmptime1 +  (((strtotime('12:00') + strtotime(medt4.Text)) - (strtotime(medt3.Text) - strtotime('12:00'))));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 :=  StrToFloat(tmpstr1);
                    end else
                    begin
                          tmptime1 := tmptime1 + ((strtotime(medt4.Text)) -  (strtotime(medt3.Text)));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 :=  StrToFloat(tmpstr1);
                    end;
            end;
            if (medt5.Text <> '  :  ') and (medt6.Text <> '  :  ') then
            begin
                    if  strtotime(medt6.Text) <  strtotime(medt5.Text) then
                    begin
                          tmptime1 := tmptime1 +  (((strtotime('12:00') + strtotime(medt6.Text)) - (strtotime(medt5.Text) - strtotime('12:00'))));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 :=  StrToFloat(tmpstr1);
                    end else
                    begin
                          tmptime1 := tmptime1 + ((strtotime(medt6.Text)) -  (strtotime(medt5.Text)));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 := StrToFloat(tmpstr1);
                    end;
            end;

           if CheckBox1.Checked then
           begin
              if (medt1.Text <> '  :  ') and (medt2.Text <> '  :  ') then
              begin
                    if  strtotime(medt2.Text) <  strtotime(medt1.Text) then
                    begin
                          tmptime2 := tmptime2 + (((strtotime('12:00') + strtotime(medt2.Text)) - (strtotime(medt1.Text) - strtotime('12:00'))));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 :=  StrToFloat(tmpstr2);
                    end else
                    begin
                          tmptime2 :=  tmptime2 +  (strtotime(medt2.Text)) -  (strtotime(medt1.Text));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end;
              end;
           end;
           if CheckBox2.Checked then
           begin
              if (medt3.Text <> '  :  ') and (medt4.Text <> '  :  ') then
              begin
                    if  strtotime(medt4.Text) <  strtotime(medt3.Text) then
                    begin
                          tmptime2 := tmptime2 + (((strtotime('12:00') + strtotime(medt4.Text)) - (strtotime(medt3.Text) - strtotime('12:00'))));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end else
                    begin
                         tmptime2 :=  tmptime2 +  (strtotime(medt4.Text)) -  (strtotime(medt3.Text));
                         if tmptime2 > StrToTime('23:59:59') then
                         tmpint2 :=  tmpint2 + 1.00;
                         tmpstr2 := TimeToStr(tmptime2);
                         for Count:=1 to Length(tmpstr2) do
                         begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                         end;
                         tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                         tmpfloat2 := StrToFloat(tmpstr2);
                    end;
              end;
           end;
           if CheckBox3.Checked then
           begin
              if (medt5.Text <> '  :  ') and (medt6.Text <> '  :  ') then
              begin
                    if  strtotime(medt6.Text) <  strtotime(medt5.Text) then
                    begin
                          tmptime2 := tmptime2 + (((strtotime('12:00') + strtotime(medt6.Text)) - (strtotime(medt5.Text) - strtotime('12:00'))));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end else
                    begin
                         tmptime2 :=  tmptime2 +  (strtotime(medt6.Text)) -  (strtotime(medt5.Text));
                         if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                         tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end;
              end;
           end;

  if changeflag1 = False then
  begin
      Edit1.Text := FormatFloat('0.00',(((Trunc(tmpfloat1 + (tmpint1 * 24))) + (Frac((tmpfloat1 + (tmpint1 * 24)))/0.60)) -((Trunc(tmpfloat2 + (tmpint2 * 24))) + (Frac((tmpfloat2 + (tmpint2 * 24)))/0.60))+zhiluo1+zhiluo2-work_rest));
      Edit4.Text := FormatFloat('0.00',((Trunc(tmpfloat2 + (tmpint2 * 24))) + (Frac((tmpfloat2 + (tmpint2 * 24)))/0.60)-overwork_rest));
  end;
end;



procedure TMain_Form.Button1Click(Sender: TObject);
var
  j : Integer;
begin
       for j := 1  to 18 do
       begin
            ShowMessage(BoolToStr(Self.Specialbit[j]));
       end;
end;

procedure TMain_Form.CheckBox6Click(Sender: TObject);
begin
    if CheckBox6.Checked then
    begin
      Edit1.Enabled := True;
    end
    else
    begin
      Edit1.Enabled := False;
    end;
    changeflag1 := False;
    Self.Calculate1(Sender);
end;

procedure TMain_Form.Edit1Exit(Sender: TObject);
var
  Count:Integer;
  tmpstr1,tmpstr2 : string;
  tmptime1,tmptime2 : TTime;

  tmpfloat1,tmpfloat2,dOut,tmpint1,tmpint2,zhiluo1,zhiluo2,work_rest,overwork_rest : Single;
begin
            tmptime1 :=  strtotime('00:00:00');
            tmptime2 :=  strtotime('00:00:00');
            tmpfloat1 := 0.00;
            tmpfloat2 := 0.00;
            tmpint1 := 0.00;
            tmpint2 := 0.00;
            zhiluo1 := Specialreal[15]/60.00;
            zhiluo2 := Specialreal[16]/60.00;
            work_rest :=0.00;
            overwork_rest := 0.00;
            if edit2.Text =''  then edit2.Text := '0.00';
            work_rest := StrToFloat(edit2.Text)/60.00;
            if edit3.Text =''  then edit3.Text := '0.00';
            overwork_rest := StrToFloat(edit3.Text)/60.00;

            if (medt1.Text <> '  :  ') and (medt2.Text <> '  :  ') then
            begin
                    if  strtotime(medt2.Text) <  strtotime(medt1.Text) then
                    begin
                          tmptime1 := tmptime1 + (((strtotime('12:00') + strtotime(medt2.Text)) - (strtotime(medt1.Text) - strtotime('12:00'))));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 := StrToFloat(tmpstr1);
                    end else
                    begin
                          tmptime1 :=  tmptime1 +  (strtotime(medt2.Text)) -  (strtotime(medt1.Text));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 := StrToFloat(tmpstr1);
                    end;
            end;
            if (medt3.Text <> '  :  ') and (medt4.Text <> '  :  ') then
            begin
                    if  strtotime(medt4.Text) <  strtotime(medt3.Text) then
                    begin
                          tmptime1 := tmptime1 +  (((strtotime('12:00') + strtotime(medt4.Text)) - (strtotime(medt3.Text) - strtotime('12:00'))));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 := StrToFloat(tmpstr1);
                    end else
                    begin
                          tmptime1 := tmptime1 + ((strtotime(medt4.Text)) -  (strtotime(medt3.Text)));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 := StrToFloat(tmpstr1);
                    end;
            end;
            if (medt5.Text <> '  :  ') and (medt6.Text <> '  :  ') then
            begin
                    if  strtotime(medt6.Text) <  strtotime(medt5.Text) then
                    begin
                          tmptime1 := tmptime1 +  (((strtotime('12:00') + strtotime(medt6.Text)) - (strtotime(medt5.Text) - strtotime('12:00'))));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 :=  StrToFloat(tmpstr1);
                    end else
                    begin
                          tmptime1 := tmptime1 + ((strtotime(medt6.Text)) -  (strtotime(medt5.Text)));
                          if tmptime1 > StrToTime('23:59:59') then
                          tmpint1 :=  tmpint1 + 1.00;
                          tmpstr1 := TimeToStr(tmptime1);
                          for Count:=1 to Length(tmpstr1) do
                          begin
                                If (tmpstr1[Count]=':')  Then
                                tmpstr1[Count] := '.';
                          end;
                          tmpstr1 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr1,5)));
                          tmpfloat1 :=  StrToFloat(tmpstr1);
                    end;
            end;
           if CheckBox1.Checked then
           begin
              if (medt1.Text <> '  :  ') and (medt2.Text <> '  :  ') then
              begin
                    if  strtotime(medt2.Text) <  strtotime(medt1.Text) then
                    begin
                          tmptime2 := tmptime2 + (((strtotime('12:00') + strtotime(medt2.Text)) - (strtotime(medt1.Text) - strtotime('12:00'))));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end else
                    begin
                          tmptime2 :=  tmptime2 +  (strtotime(medt2.Text)) -  (strtotime(medt1.Text));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end;
              end;
           end;
           if CheckBox2.Checked then
           begin
              if (medt3.Text <> '  :  ') and (medt4.Text <> '  :  ') then
              begin
                    if  strtotime(medt4.Text) <  strtotime(medt3.Text) then
                    begin
                          tmptime2 := tmptime2 + (((strtotime('12:00') + strtotime(medt4.Text)) - (strtotime(medt3.Text) - strtotime('12:00'))));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end else
                    begin
                          tmptime2 :=  tmptime2 +  (strtotime(medt4.Text)) -  (strtotime(medt3.Text));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end;
              end;
           end;
           if CheckBox3.Checked then
           begin
              if (medt5.Text <> '  :  ') and (medt6.Text <> '  :  ') then
              begin
                    if  strtotime(medt6.Text) <  strtotime(medt5.Text) then
                    begin
                          tmptime2 := tmptime2 + (((strtotime('12:00') + strtotime(medt6.Text)) - (strtotime(medt5.Text) - strtotime('12:00'))));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 := StrToFloat(tmpstr2);
                    end else
                    begin
                          tmptime2 :=  tmptime2 +  (strtotime(medt6.Text)) -  (strtotime(medt5.Text));
                          if tmptime2 > StrToTime('23:59:59') then
                          tmpint2 :=  tmpint2 + 1.00;
                          tmpstr2 := TimeToStr(tmptime2);
                          for Count:=1 to Length(tmpstr2) do
                          begin
                                If (tmpstr2[Count]=':')  Then
                                tmpstr2[Count] := '.';
                          end;
                          tmpstr2 := FormatFloat('0.00',StrToFloat(LeftStr(tmpstr2,5)));
                          tmpfloat2 :=  StrToFloat(tmpstr2);
                    end;
              end;
           end;

           if (Edit1.Text <> '')  then
           begin
                  if  TryStrToFloat(Edit1.Text,dOut) then
                  begin
                         if  (StrToFloat(Edit1.Text) > (( Trunc((((tmpfloat1 + (tmpint1 * 24)) - (tmpfloat2 + (tmpint2 * 24)))))) + (Frac((((tmpfloat1 + (tmpint1 * 24)) - (tmpfloat2 + (tmpint2 * 24)))))/0.60)+zhiluo1+zhiluo2-work_rest )) then {(((tmpfloat1 + (tmpint1 * 24)) - (tmpfloat2 + (tmpint2 * 24)))))}
                         begin
                                ShowMessage('正班时不可大于时段总和...');
                                Edit1.Text :=  FormatFloat ('0.00',(((Trunc(tmpfloat1 + (tmpint1 * 24))) +(Frac((tmpfloat1 + (tmpint1 * 24)))/0.60)) -((Trunc(tmpfloat2 + (tmpint2 * 24))) +(Frac((tmpfloat2 + (tmpint2 * 24)))/0.60))+zhiluo1+zhiluo2-work_rest));
                                Edit4.Text := FormatFloat('0.00',((Trunc(tmpfloat2 + (tmpint2 * 24))) + (Frac((tmpfloat2 + (tmpint2 * 24)))/0.60) - overwork_rest));
                                Edit1.SetFocus;
                                changeflag1 := False;
                         end else
                         begin
                               if (Edit4.Text <> '') then
                               begin
                                    Edit4.Text := FormatFloat('0.00',((Trunc(tmpfloat2 + (tmpint2 * 24))) + (Frac((tmpfloat2 + (tmpint2 * 24)))/0.60)));
                                    Edit4.Text := FormatFloat('0.00',StrToFloat(Edit4.Text) + ((((Trunc(tmpfloat1 + (tmpint1 * 24))) + (Frac((tmpfloat1 + (tmpint1 * 24)))/0.60)) - ((Trunc(tmpfloat2 + (tmpint2 * 24))) + (Frac((tmpfloat2 + (tmpint2 * 24)))/0.60))+zhiluo1+zhiluo2-work_rest)) - StrToFloat(Edit1.Text) - overwork_rest);

                               end else
                               begin
                                    Edit4.Text := '0.00';
                                    Edit4.Text := FormatFloat('0.00',StrToFloat(Edit4.Text) + ((((Trunc(tmpfloat1 + (tmpint1 * 24))) + (Frac((tmpfloat1 + (tmpint1 * 24)))/0.60)) - ((Trunc(tmpfloat2 + (tmpint2 * 24))) + (Frac((tmpfloat2 + (tmpint2 * 24)))/0.60))+zhiluo1+zhiluo2-work_rest)) - StrToFloat(Edit1.Text)- overwork_rest );


                               end;
                               changeflag1 := True;
                         end;
                  end;
           end;
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
  Self.dgh_rulerColExit(Sender);
  if DM.qry_ruler.IsEmpty then exit;
  i := DM.qry_rulerrkey.AsInteger ;
  DM.qry_ruler.Close;
  DM.qry_ruler.Open;
  DM.qry_ruler.Locate('rkey',i,[]);
end;

procedure TMain_Form.CheckBox1Click(Sender: TObject);
begin
   changeflag1 := False;
   Self.Calculate1(Sender);
end;

procedure TMain_Form.CheckBox2Click(Sender: TObject);
begin
  changeflag1 := False;
  Self.Calculate1(Sender);
end;

procedure TMain_Form.CheckBox3Click(Sender: TObject);
begin
  changeflag1 := False;
  Self.Calculate1(Sender);
end;

procedure TMain_Form.dgh_rulerTitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry_ruler.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry_ruler.Sort:=Column.FieldName+' DESC';
  end;
  if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
        self.field_name:=column.FieldName;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
  end
end;



procedure TMain_Form.N7Click(Sender: TObject);
begin
   if ((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
    bbt_delClick(Sender);
end;

procedure TMain_Form.medt3KeyPress(Sender: TObject; var Key: Char);
begin
        changeflag1 := False;
end;

procedure TMain_Form.medt4KeyPress(Sender: TObject; var Key: Char);
begin
        changeflag1 := False;
end;

procedure TMain_Form.medt5KeyPress(Sender: TObject; var Key: Char);
begin
        changeflag1 := False;
end;

procedure TMain_Form.medt6KeyPress(Sender: TObject; var Key: Char);
begin
        changeflag1 := False;
end;

procedure TMain_Form.edt_1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', 'A'..'Z', 'a'..'z', #8, #46]) then Key := #0;
end;



procedure TMain_Form.btn1Click(Sender: TObject);
begin
dm.qry3.Open;
Export_dbGridEH_to_Excel(dbgrdh1,'班次设置');
dm.qry3.close;
end;

end.
