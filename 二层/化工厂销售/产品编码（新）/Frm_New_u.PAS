unit Frm_New_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TFrm_New = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BtnOk: TButton;
    Button2: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ctype: TLabel;
    Label12: TLabel;
    MaskEdit1: TMaskEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    qrytemp: TADOQuery;
    procedure BtnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function mask_value(inv_number:string):string;
    function Power(x, y : extended) : extended;
  private
    function svValid:boolean;
  public


  end;

var
  Frm_New: TFrm_New;

implementation
uses  DM_u, invtype_search, Unit_search;
{$R *.dfm}

procedure TFrm_New.BtnOkClick(Sender: TObject);
begin
  if not svValid then abort;
  try
   {dm.AQ17CRITICAL_MATL_FLAG.Value :=0;  //重要材料
    dm.AQ17STOP_PURCH.Value := 'N';       //停止采购黩为为N
    dm.AQ17AVL_FLAG.Value := 'N';         //材料需要认可供应商
    dm.AQ17AUTO_PURCHASE_FLAG.Value :=0;  //自动采购
    dm.AQ17INSPECT.Value := 'N';          //检查
    dm.AQ17MIX_PARTS.Value := 'N';        //允许混合部件
    //保存期限默认365天
    //单位与当物品的时候一样
    if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
      dm.AQ17STOCK_PURCH.Value :=1
    else
      dm.AQ17STOCK_PURCH.Value :=0;
    dm.AQ17GROUP_PTR.Value:=edit1.Tag;
    dm.AQ17PURCH_UNIT_PTR.Value:=edit3.Tag;
    dm.AQ17STOCK_UNIT_PTR.Value:=edit2.Tag;
    dm.AQ17INV_PART_NUMBER.Value:=maskedit1.Text;
    dm.AQ17INV_NAME.Value:=Edit5.Text;
    dm.AQ17INV_DESCRIPTION.Value:=edit4.Text;
    dm.AQ17S_B_N.Value :='B';    //存储方法默认按批次 (这个赋值暂时不起作用)
                }
  if qrytemp.Active then qrytemp.Active := false;
   qrytemp.SQL.Clear;
   qrytemp.SQL.Text :=' insert into data0017 '+
                      '(INV_PART_NUMBER,INV_NAME,INV_DESCRIPTION,GROUP_PTR,CRITICAL_MATL_FLAG,'+
                      'STOP_PURCH,AVL_FLAG,AUTO_PURCHASE_FLAG,INSPECT,MIX_PARTS,STOCK_PURCH,'+
                      'STOCK_UNIT_PTR,PURCH_UNIT_PTR,S_B_N,SHELF_LIFE) '+
                      'select '+quotedstr(MaskEdit1.Text)+','+
                      QuotedStr(Edit5.Text)+','+quotedstr(Edit4.Text)+','+inttostr(edit1.Tag)+
                      ',0,'+QuotedStr('N')+','+QuotedStr('N')+',0,'+QuotedStr('N')+','
                      +QuotedStr('N')+',1,'+inttostr(Edit2.Tag)+','+inttostr(Edit3.Tag)+','+QuotedStr('B')+',360';
   qrytemp.ExecSQL;

    ModalResult:=mrok;
 except
 on E: Exception do
  begin
   messagedlg(E.Message,mterror,[mbcancel],0);
   abort;
  end;
 end;
           

end;

procedure TFrm_New.BitBtn1Click(Sender: TObject);
begin
  try
    form_invtype:=tform_invtype.Create(application);

    form_invtype.Edit1.Text :=trim(edit1.Text);
    if form_invtype.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
      edit1.SetFocus;
    end
    else
    if form_invtype.ShowModal=mrok then
    begin
       edit1.Text := form_invtype.ADOQuery1GROUP_NAME.Value;
       edit1.Font.Color := clwindowtext;
       label7.Caption := form_invtype.ADOQuery1GROUP_DESC.Value;
       edit1.Tag:= form_invtype.ADOQuery1RKEY.Value;
       ctype.Caption := form_invtype.ADOQuery1ctype.Value;
       if form_invtype.ADOQuery1if_flag.Value=0 then //掩码
          MaskEdit1.EditMask:=form_invtype.ADOQuery1mask_inv_number.Value
       else
       if form_invtype.ADOQuery1if_flag.Value=1 then //更改if_flag =1（作为初始值）的处理情况
        begin
          MaskEdit1.EditMask :='';
          MaskEdit1.Text := form_invtype.ADOQuery1mask_inv_number.Value;
        end
       else                                      //手动
       if form_invtype.ADOQuery1if_flag.Value=2 then  //新增if_flag=2(手工输入)的处理情况
        begin
          MaskEdit1.EditMask :='';
          MaskEdit1.Text := '';
        end;
    end;
 finally
   form_invtype.free;
 end;
end;

procedure TFrm_New.Edit1Click(Sender: TObject);
begin
  if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color :=clblue;
  end;
end;

procedure TFrm_New.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (trim(edit1.Text)<>'') then
 with dm.tmp do
 begin
    close;
    Sql.Text :='SELECT DATA0496.RKEY, DATA0496.GROUP_DESC, DATA0019.INV_GROUP_DESC, ' + #13 +
      'CASE DATA0496.TTYPE WHEN ''P'' THEN ''原材料'' WHEN ''T'' THEN ''外发加工'' ELSE ''杂项'' END AS CTYPE, '  + #13 +
      'DATA0496.IF_FLAG, DATA0496.MASK_INV_NUMBER '+#13+
      'FROM DATA0496 ' + #13 +
      'INNER JOIN DATA0019 ON DATA0496.GROUP_PTR = DATA0019.RKEY ' + #13 +
      'WHERE GROUP_NAME = '+ quotedstr(trim(edit1.Text));
    OPEN;
    if isempty then
    begin
     messagedlg('物料类别输入错误!请重新输入或选择！',mterror,[mbcancel],0);
     label7.Caption:='';
     edit1.SetFocus;
    end
    else
  if Edit1.Tag<>fieldbyname('rkey').Value then
  begin
    edit1.Font.Color:=clwindowtext;
    label7.Caption:=fieldbyname('GROUP_DESC').AsString;

    Edit1.Tag :=  fieldbyname('rkey').Value;

    ctype.Caption := fieldbyname('CTYPE').AsString;

   if fieldbyname('IF_FLAG').Value = 0 then
      MaskEdit1.EditMask:=  fieldbyname('MASK_INV_NUMBER').AsString
   else
   if fieldbyname('IF_FLAG').Value = 1 then //更改if_flag =1（作为初始值）的处理情况
    begin
      MaskEdit1.EditMask:= '';
      MaskEdit1.Text := fieldbyname('MASK_INV_NUMBER').AsString
    end
   else
   if fieldbyname('IF_FLAG').Value = 2 then  //新增if_flag=2(手工输入)的处理情况
    begin
      MaskEdit1.EditMask:= '';
      MaskEdit1.Text := '';
    end
  end;
 end
else
 edit1.Font.Color :=clblue;
end;

procedure TFrm_New.BitBtn2Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where stock=''Y''');
    open;
   end;
  form_unit.Edit1.Text :=trim(edit2.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit2.Font.Color := clwindowtext;
     label8.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
//     dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
      edit2.Tag:=form_unit.ADOQuery1.FieldValues['rkey'];
     if edit3.Font.Color = clblue then
      begin
       edit3.Text := edit2.Text;
       edit3.Font.Color := clwindowtext;
       label9.Caption := label8.Caption;
//       dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
       edit3.tag:=form_unit.ADOQuery1.FieldValues['rkey'];
      end;
     edit3.SetFocus;
    end
   else
    edit2.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TFrm_New.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color=clwindowtext then
  begin
   edit2.SelectAll;
   edit2.Font.Color :=clblue;
  end;
end;

procedure TFrm_New.Edit2Exit(Sender: TObject);
begin
  if (activecontrol.Name<>'BitBtn2') and (trim(edit2.Text)<>'') then
  with dm.tmp do
  begin
    sql.Clear;
    close;
    sql.Text:='SELECT RKEY,UNIT_CODE,UNIT_NAME '+#13+
    'FROM DATA0002 WHERE STOCK = ''Y'' AND UNIT_CODE = '+ quotedstr(trim(edit2.Text)) +#13+
    'ORDER BY UNIT_CODE';
    OPEN;
    if isempty then
    begin
      messagedlg('单位代码不正确,请重新输入或选择',mterror,[mbcancel],0);
      label8.Caption := '';
      edit2.SetFocus;
    end
    else
    begin
      edit2.Font.Color:=clwindowtext;
      label8.Caption:=fieldbyname('unit_name').AsString;
      edit2.Tag:= fieldbyname('rkey').Value;
      if edit3.Font.Color = clblue then
      begin
       edit3.Text := edit2.Text;
       edit3.Font.Color := clwindowtext;
       label9.Caption := label8.Caption;
       edit3.Tag:=fieldbyname('rkey').Value;
      end;
    end;
  end;
end;

procedure TFrm_New.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
  begin
   edit3.SelectAll;
   edit3.Font.Color :=clblue;
  end;
end;

procedure TFrm_New.BitBtn3Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where purch=''Y''');
    open;
   end;  
  form_unit.Edit1.Text :=trim(edit3.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit3.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit3.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit3.Font.Color := clwindowtext;
     label9.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
//     dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
      edit3.Tag:= form_unit.ADOQuery1.FieldValues['rkey'];
     if edit2.Font.Color = clblue then
      begin
       edit2.Text := edit3.Text;
       edit2.Font.Color := clwindowtext;
       label8.Caption := label9.Caption;
       edit2.tag:=form_unit.ADOQuery1.FieldValues['rkey'];
//       dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
      end;
    end
   else
    edit3.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TFrm_New.Edit3Exit(Sender: TObject);
begin
  if (activecontrol.Name<>'BitBtn3') and (trim(edit3.Text)<>'') then
// try
//  form_unit := Tform_unit.Create(Application);
//  with form_unit.ADOQuery1 do
//   begin
//    close;
//    SQL.Insert(1,'where purch=''Y''');
//    open;
//   end;
//  form_unit.Edit1.Text:=trim(edit3.Text);
// if comparetext(trim(edit3.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
//  begin
//   edit3.Font.Color:=clwindowtext;
//   label9.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
//   //dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
//   edit3.tag:= form_unit.ADOQuery1.FieldValues['rkey'];
//   if edit2.Font.Color = clblue then
//    begin
//     edit2.Text := edit3.Text;
//     edit2.Font.Color := clwindowtext;
//     label8.Caption := label9.Caption;
//     //dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
//     edit2.tag:= form_unit.ADOQuery1.FieldValues['rkey'];
//    end;
//  end
// else
//  begin
//   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
//   label9.Caption:='';
//   edit3.SetFocus;
//  end;
// finally
//  form_unit.free;
// end
  with dm.tmp do
  begin
    sql.Clear;
    close;
    sql.Text:='SELECT RKEY,UNIT_CODE,UNIT_NAME '+#13+
    'FROM DATA0002 WHERE PURCH = ''Y'' AND UNIT_CODE = '+ quotedstr(trim(edit3.Text)) +#13+
    'ORDER BY UNIT_CODE';
    OPEN;
    if isempty then
    begin
      messagedlg('单位代码不正确,请重新输入或选择',mterror,[mbcancel],0);
      label9.Caption := '';
      edit3.SetFocus;
    end
    else
    begin
      edit3.Font.Color:=clwindowtext;
      label9.Caption:=fieldbyname('unit_name').AsString;
      edit3.Tag := fieldbyname('rkey').Value;
      if edit2.Font.Color = clblue then
      begin
        edit2.Text := edit3.Text;
        edit2.Font.Color := clwindowtext;
        label8.Caption := label9.Caption;
        edit2.Tag := fieldbyname('rkey').Value;
      end;
    end;
  end
  else
  edit3.Font.Color :=clblue;
end;

procedure TFrm_New.Button2Click(Sender: TObject);
begin
 // dm.AQ18.Close;
end;

procedure TFrm_New.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //dm.AQ17INV_PART_NUMBER.EditMask:='';
end;

function TFrm_New.mask_value(inv_number: string): string;
var
 v_leng,i:byte;
 v_last:extended;
begin
 v_leng := length(inv_number);
 for i := v_leng downto 1 do
  begin
   if (copy(inv_number,i,1) < '0') or (copy(inv_number,i,1) > '9')  then //如果不是数字
    begin
     v_last := power(10,v_leng-i) + StrToInt64(copy(inv_number,i+1,v_leng-i))+1;
     result := copy(inv_number,1,i) + copy(floattostr(v_last),2,v_leng-i);
     break;
    end
   else                                      //如果是数字
    if i=1 then //如果第一位仍然是数字
     begin
      v_last := power(10,v_leng)+StrToInt64(inv_number)+1;
      result := copy(floattostr(v_last),2,v_leng);
     end;
  end;
end;

function TFrm_New.Power(x, y : extended) : extended;
 begin
  result := exp(y*ln(x));
 end;

function TFrm_New.svValid: boolean;
begin
  result:=false;
 if trim(maskedit1.Text)='' then
  begin
   messagedlg('材料代码不能为空!',mtwarning,[mbok],0);
   MaskEdit1.SetFocus;
   exit;
  end;
 if trim(edit5.Text)='' then
  begin
   messagedlg('材料名称不能为空!',mtwarning,[mbok],0);
   edit5.SetFocus;
   exit;
  end;
 if trim(edit4.Text)='' then
  begin
   messagedlg('材料规格不能为空!',mtwarning,[mbok],0);
   edit4.SetFocus;
   exit;
  end;

 if edit1.Tag =0 then
  begin
   messagedlg('材料类别不能为空!',mtwarning,[mbok],0);
   edit1.SetFocus;
   exit;
  end;

 if edit2.Font.Color =clblue then
  begin
   messagedlg('存货单位不能为空!',mtwarning,[mbok],0);
   edit2.SetFocus;
   exit;
  end;
 if edit3.Font.Color =clblue then
  begin
   messagedlg('采购单位不能为空!',mtwarning,[mbok],0);
   edit3.SetFocus;
   exit;
  end;

 with DM.tmp do
  begin
    if dm.Tmp.Active then DM.Tmp.Active:= False;
    //Close;
    SQL.Text:='select rkey from data0017 where INV_PART_NUMBER='+quotedstr(MaskEdit1.Text);
    open;
    if not  IsEmpty then
     begin
       messagedlg('材料代码重复!',mtwarning,[mbok],0);
       MaskEdit1.SetFocus;
       exit;
     end;
  end;

  result:=true;
end;

end.
