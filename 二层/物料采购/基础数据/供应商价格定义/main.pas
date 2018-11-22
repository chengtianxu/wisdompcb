unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, Mask,
  DBCtrls, Menus, DB, ADODB,ComObj, Excel2000,ClipBrd;

type
  TForm1 = class(TForm)
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    supp_rkey: TLabel;
    inv_rkey: TLabel;
    empl_ptr: TLabel;
    N4: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Button1: TButton;
    BitBtn4: TBitBtn;
    N5: TMenuItem;
    BitBtn5: TBitBtn;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    BitBtn6: TBitBtn;
    new_rkey: TLabel;
    new_code: TLabel;
    new_name: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Button2: TButton;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn6Enter(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    sql_text:string;
    supp_status,STOP_PURCH:string;
  public
    { Public declarations }
    sys_longdate:string;
    sys_sortdate:tdatetime;
    iChick:Integer;
  end;

var
 Form1: TForm1;

implementation
uses damo, supplier_search, inv_serach, edit_price, price_change,
  price_changelist,common,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.ItemIndex=0 then
  begin
    dbgrid1.Columns[0].FieldName := 'inv_part_number';
    dbgrid1.Columns[1].FieldName := 'inv_part_description';
    dbgrid1.Columns[0].Title.caption := '*材料代码';
    dbgrid1.Columns[1].Title.caption := '材料描述';
    label1.Caption := '供应商代码:';
    dbgrid1.Columns[0].Width :=129;
    dbgrid1.Columns[1].Width :=210;
    edit1.Visible := true;
    bitbtn2.Visible := true;
    label2.Visible := true;
    edit2.Visible := false;
    bitbtn3.Visible := false;
    label4.Visible := false;
    edit2.Text := '';
    edit2.Font.Color := clblue;
    label4.Caption := '';
    BitBtn6.Enabled:=True;
    iChick:=0;
  end
  else
  begin
    dbgrid1.Columns[0].FieldName := 'code';
    dbgrid1.Columns[1].FieldName := 'supplier_name';
    dbgrid1.Columns[0].Title.caption := '*供应商代码';
    dbgrid1.Columns[1].Title.caption := '供应商姓名';
    label1.Caption := '材料代码';
    dbgrid1.Columns[0].Width :=80;
    dbgrid1.Columns[1].Width :=260;
    edit1.Visible := false;
    bitbtn2.Visible := false;
    label2.Visible := false;
    edit2.Visible := true;
    bitbtn3.Visible := true;
    label4.Visible := true;
    edit1.Text := '';
    edit1.Font.Color := clblue;
    label2.Caption := '';
    BitBtn6.Enabled:=False;
    iChick:=0;
  end;
  dm.aq0028.Close;
  bitbtn4.Enabled:=false;
  button1.Enabled:=false;
  Button2.Enabled:=False;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  try
    form_supp:=tform_supp.Create(application);
    if form_supp.ShowModal=mrok then
    begin
      edit1.Text := form_supp.ADOQuery1CODE.AsString;
      edit1.Font.Color := clwindowtext;
      label2.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
      supp_rkey.Caption := form_supp.ADOQuery1.fieldbyname('rkey').AsString;
      self.supp_status:= Form_supp.ADOQuery1supper_status.Value;
      with dm.aq0028 do
      begin
        active:=false;
        sql.Delete(sql.Count-2);
        sql.Delete(sql.Count-1);
        sql.Add('data0028.supplier_ptr='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
        sql.Add('order by inv_part_number');
        Prepared;
        active:=true;
      end;
      if not dm.aq0028.IsEmpty then
        bitbtn4.Enabled:=true
      else
        bitbtn4.Enabled:=false;
      dbgrid1.SetFocus;
      button1.Enabled:=true;
      Button2.Enabled:=True;
    end
    else
      edit1.SetFocus;
  finally
    form_supp.free;
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  try
    form_inv:=tform_inv.Create(application);

    form_inv.ADOQuery1.Close;
    if trim(edit2.Text)<>'' then
    form_inv.ADOQuery1.SQL.Insert(form_inv.ADOQuery1.SQL.Count-1,
                                   'and INV_PART_NUMBER like ''%'+trim(edit2.Text)+'%''');
    form_inv.ADOQuery1.Prepared;
    form_inv.ADOQuery1.Open;

    if form_inv.ShowModal=mrok then
    begin
      edit2.Text := form_inv.ADOQuery1INV_PART_NUMBER.Value;
      edit2.Font.Color := clwindowtext;
      label4.Caption := form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
      INV_rkey.Caption := form_inv.ADOQuery1RKEY.AsString;
      Self.STOP_PURCH := form_inv.ADOQuery1STOP_PURCH.Value;
      with dm.aq0028 do
      begin
        active:=false;
        sql.Delete(sql.Count-2);
        sql.Delete(sql.Count-1);
        sql.Add('data0028.inventory_ptr='+form_inv.ADOQuery1.fieldbyname('rkey').AsString);
        sql.Add('order by code');
        Prepared;
        active:=true;
      end;
       if not dm.aq0028.IsEmpty then bitbtn4.Enabled:=true else bitbtn4.Enabled:=false;
      dbgrid1.SetFocus;
    end
    else edit2.SetFocus;
  finally
    form_inv.free;
  end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
   if edit1.Font.Color = clwindowtext then
   begin
     edit1.Font.Color := clblue;
     edit1.SelectAll;
   end;
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color = clwindowtext then
 begin
  edit2.Font.Color := clblue;
  edit2.SelectAll;
 end;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
  if (activecontrol.Name<>'BitBtn3') and (trim(edit2.Text)<>'') then
  begin
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT RKEY, INV_PART_NUMBER, INV_PART_DESCRIPTION FROM Data0017 where inv_part_number=' + QuotedStr(Trim(Edit2.Text));
      Open;
      if not IsEmpty then
      begin
        edit2.Font.Color := clwindowtext;
        label4.Caption := fieldByName('INV_PART_DESCRIPTION').AsString;
        INV_rkey.Caption := fieldByName('rkey').AsString;
        with dm.aq0028 do
        begin
          active:=false;
          sql.Delete(sql.Count-2);
          sql.Delete(sql.Count-1);
          sql.Add('data0028.inventory_ptr=' + DM.ADOQuery1.fieldbyname('rkey').AsString);
          sql.Add('order by code');
          active:=true;
        end;
        if not dm.aq0028.IsEmpty then bitbtn4.Enabled:=true else bitbtn4.Enabled:=false;
      end
      else
      begin
        messagedlg('材料编码不正确,请重新输入或选择',mtinformation,[mbok],0);
        label4.Caption := '';
        edit2.SetFocus;
      end
    end;
  end
  else
  if (activecontrol.Name<>'BitBtn3') and (trim(edit2.Text)='') then
  begin
    label4.Caption:='';
    dm.aq0028.Close;
    bitbtn4.Enabled:=false;
  end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);

begin
  if (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)<>'') then
  begin
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT RKEY, CODE, SUPPLIER_NAME, '
        + ' case status when 0 then ''有效'' when 1 then ''无效'' end as supper_status FROM  Data0023 '
        + ' where code= ' + QuotedStr(Trim(Edit1.Text));
      Open;
      if not IsEmpty then
      begin
        edit1.Font.Color := clwindowtext;
        label2.Caption := FieldByName('supplier_name').AsString;
        supp_rkey.Caption := FieldByName('rkey').AsString;
        self.supp_status := FieldByName('supper_status').AsString;
        with dm.aq0028 do
        begin
          active:=false;
          sql.Delete(sql.Count-2);
          sql.Delete(sql.Count-1);
          sql.Add('data0028.supplier_ptr=' + DM.ADOQuery1.fieldbyname('rkey').AsString);
          //2012.11.30修改排序
          //if (iChick=0) then sql.Add('order by inv_part_number') else
          sql.Add(' order by inv_part_description ');
          active:=true;
        end;
        if not dm.aq0028.IsEmpty then bitbtn4.Enabled:=true else bitbtn4.Enabled:=false;
        button1.Enabled:=true;
      end
      else
      begin
       messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
       label2.Caption := '';
       edit1.SetFocus;
      end;
    end;
  end
  else
  if (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)='') then
  begin
    label2.Caption:='';
    dm.aq0028.Close;
    button1.Enabled:=false;
    bitbtn4.Enabled:=false;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 rkey28:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
  end;
  dm.ADO28.Close;
  dm.ADO28.Parameters[0].Value := dm.aq0028.FieldValues['rkey'];
  dm.ADO28.open;

  dm.qryFtp.Close;
  dm.qryFtp.Parameters[0].Value := null;
  dm.qryFtp.open;
  dm.qry28_1.Close;
  dm.qry28_1.Parameters[0].Value := 0;
  dm.qry28_1.open;
  dm.qryFile.Close;
  dm.qryFile.Parameters[0].Value := DM.ADO28RKEY.Value;
  dm.qryFile.open;

  dm.ADO28.Edit;
  try
    form2:=tform2.Create(application);
    form2.Edit1.Text := dm.aq0028.FieldValues['inv_part_number'];
    form2.label9.Caption := dm.aq0028.FieldValues['inv_part_description'];
    form2.Edit1.Enabled := false;
    form2.BitBtn4.Enabled := false;
    form2.Edit2.Text := dm.aq0028.fieldvalues['code'];
    form2.label10.Caption := dm.aq0028.FieldValues['supplier_name'];
    form2.Edit2.Enabled := false;
    form2.BitBtn5.Enabled := false;
    form2.Edit3.Text := dm.aq0028.fieldvalues['curr_code'];
    form2.label11.Caption := dm.aq0028.FieldValues['curr_name'];
    form2.Edit3.Enabled := true;
    form2.BitBtn6.Enabled := true;
    form2.Edit5.Text := dm.aq0028.FieldValues['unit_code']; //采购单位
    form2.Label12.Caption := dm.aq0028.FieldValues['unit_name'];
    Form2.Edit9.Text:=DM.aq0028qte_price2.Text;
    if Trim(DM.aq0028CATALOG_NUM.Value)='Y' then
     Form2.CheckBox1.Checked:=True
    else
    Form2.CheckBox1.Checked:=False;
    form2.BitBtn8.Enabled:=Form2.CheckBox1.Checked;
    form2.Edit10.Text:=dm.aq0028model.AsString;
    form2.Edit10.Tag:=DM.aq0028prot_report_ptr.Value;
    if form2.ShowModal=mrok then
    begin
      rkey28:=dm.aq0028.FieldValues['rkey'];
      dm.aq0028.Close;
      dm.aq0028.Open;
      //2012-11.30修改排序
      if (iChick=0) then  DM.aq0028.Sort:= 'inv_part_number'
       else if (iChick=1) then DM.aq0028.Sort:= 'inv_part_description';
      dm.aq0028.Locate('rkey',rkey28,[]);
    end;
  finally
    form2.free;
  end;

end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.aq0028.Active=false then
  begin
   n1.Enabled :=false;
   n2.Enabled :=false;
   n3.Enabled :=false;
   n4.Enabled :=false;
   n5.Enabled :=false;
  end
 else
  if dm.aq0028.IsEmpty then
   begin
    n1.Enabled := true;
    n2.Enabled := false;
    n3.Enabled := false;
    n4.Enabled := false;
    n5.Enabled := false;
   end
  else
   begin
    n1.Enabled := true;
    n2.Enabled := true;
    n3.Enabled := true;
    n4.Enabled := true;
    n5.Enabled := true;
   end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 rkey28:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   begin
    ShowMsg('对不起您只有该程序的只读权限',1);
    exit;
   end;

  if ((radiogroup1.ItemIndex=0) and (Self.supp_status='无效')) or
     ((radiogroup1.ItemIndex=1) and (Self.STOP_PURCH='Y')) then  //按供应商来新增
   begin
    ShowMsg('该供应商或材料不允许新增档案!',1);
    Exit;
   end;
  dm.ADO28.Close;
  dm.ADO28.Parameters[0].Value := null;
  dm.ADO28.open;
  dm.ADO28.Append;

  dm.qryFtp.Close;
  dm.qryFtp.Parameters[0].Value := null;
  dm.qryFtp.open;
  dm.qry28_1.Close;
  dm.qry28_1.Parameters[0].Value := 0;
  dm.qry28_1.open;
  dm.qryFile.Close;
  dm.qryFile.Parameters[0].Value := 0;
  dm.qryFile.open;
  
  dm.ADO28SUGG_REORDER_QTY.Value:=0;  //建议重购数量
  dm.ADO28TAX_FLAG.Value:='Y';   //价格含税
  try
    form2:=tform2.Create(application);
    form2.BitBtn1.Enabled := false;
//    form2.BitBtn2.Enabled := false;
    form2.PageControl1.Enabled := false;
    form2.Edit3.Enabled := false;
    form2.BitBtn6.Enabled := false;
    form2.Edit4.Enabled :=false;
    form2.Edit5.Enabled :=false;
    form2.BitBtn7.Enabled :=false;
    form2.DBEdit3.Enabled := false;
    if radiogroup1.ItemIndex=0 then  //按供应商来新增
    begin
      dm.ADO28SUPPLIER_PTR.AsString := supp_rkey.Caption; //给供应商指针赋值
      with dm.ADOQuery1 do
      begin
        if active=true then active:=false;
        sql.Clear;
        sql.Add('select data0001.rkey,data0001.curr_code,data0001.curr_name');
        sql.Add('from data0023 inner join data0001');
        sql.Add('on data0023.currency_ptr=data0001.rkey');
        sql.Add('where data0023.rkey='''+supp_rkey.Caption+'''');
        active:=true;
        dm.ADO28CURRENCY_PTR.Value := fieldvalues['rkey']; //给货币指针赋值
        form2.Edit3.Text := fieldvalues['curr_code'];
        form2.Label11.Caption := fieldvalues['curr_name'];
      end;
      with dm.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT Data0024.SHIPPING_LEAD_TIME,Data0189.STATE_TAX');
        sql.Add('FROM Data0024 INNER JOIN');
        sql.Add('Data0189 ON Data0024.CITY_TAX_PTR = Data0189.RKEY');
        sql.Add('where Data0024.SUPPLIER_PTR='+dm.ADO28SUPPLIER_PTR.AsString);
        sql.Add('order by data0024.rkey');
        open;
        dm.ADO28LEAD_TIME.Value := fieldvalues['SHIPPING_LEAD_TIME'];
        dm.ADO28TAX_2.Value := fieldvalues['state_tax'];
      end;
      form2.Edit2.Text := edit1.Text;
      form2.label10.Caption := label2.Caption;
      form2.Edit2.Enabled := false;
      form2.BitBtn5.Enabled := false;
      form2.DBEdit3.Field.Value := 0;
    end
    else  //如果是按库存材料来新增
    begin
      dm.ADO28INVENTORY_PTR.AsString := inv_rkey.Caption;
      with dm.adoquery2 do
      begin                //查找存货单位 ..同时查找首选供应商
        active:=false;
        sql.Clear;
        SQL.Add('SELECT unit_code,unit_name,shelf_life,data0023.code,isnull(CATALOG_NUM,'''') as catalog_num,data0017.manufacturer_name');
        sql.add('from data0002,data0017 left outer join data0023');
        sql.Add('on data0017.pref_supplier_ptr= data0023.rkey');
        sql.Add('where data0017.stock_unit_ptr=data0002.rkey');
        sql.Add('and data0017.rkey='+inv_rkey.Caption);
        active:=true;
        form2.Edit4.Text := fieldvalues['unit_code'];
        form2.label13.Caption := fieldvalues['unit_name'];
        form2.Edit9.Text:=FieldByName('shelf_life').AsString;
        Form2.Edit9.Enabled:=FieldByName('SHELF_LIFE').AsInteger<>0; //有效期天数为0不允许修改
        form2.Label22.Caption := '首选供应商: '+fieldbyname('code').AsString;
        if Trim(FieldByName('CATALOG_NUM').Value)='Y' then
        Form2.CheckBox1.Checked:=True
        else
        Form2.CheckBox1.Checked:=False;
        Form2.bitbtn8.Enabled:=Form2.CheckBox1.Checked;
        dm.ADO28SUPPLIER_PART_NO.AsString:= FieldByName('manufacturer_name').AsString;
      end;
  //==============================================================================
      with dm.adoquery2 do
      begin                 //查找采购单位  同时查找材料可用标记,单位转换率
        active:=false;
        sql.Clear;
        sql.Add('select data0002.rkey,unit_code,unit_name,avl_flag,stock_purch');
        sql.Add('from data0002,data0017');
        sql.Add('where data0017.purch_unit_ptr=data0002.rkey and');
        sql.Add('data0017.rkey='+inv_rkey.Caption);
        active:=true;
        form2.edit5.Text := fieldvalues['unit_code'];
        form2.Edit5.Font.Color := clwindowtext;
        form2.label12.Caption := fieldvalues['unit_name'];
        dm.ADO28PURCHASE_UNIT_PTR.Value := fieldvalues['rkey'];   //给采购单位赋值
        form2.dbedit3.Field.Value := fieldvalues['stock_purch'];  //单位转换率
        if fieldvalues['avl_flag']='N' then
        begin
          dm.ADO28AVL_FLAG.Value := 'Y';
          form2.combobox1.ItemIndex :=0;
        end
        else
        begin
          dm.ADO28AVL_FLAG.Value := 'N';
          form2.combobox1.ItemIndex :=1;
        end;
        form2.combobox2.ItemIndex :=0;     //订购方法
        dm.ADO28AMT_QUAN_FLAG.Value :=1;   //给订购方法赋值 默认按数量....
      end;
      form2.Edit1.Text := edit2.Text;
      form2.Label9.Caption := label4.Caption;
      form2.Edit1.Enabled := false;
      form2.BitBtn4.Enabled := false;
    end;
  //==============================================================================
    if form2.ShowModal=mrok then
    begin
      rkey28:=dm.ADO28RKEY.Value;
      dm.aq0028.Close;
      dm.aq0028.Open;
      dm.aq0028.Locate('rkey',rkey28,[]);
    end;
  finally
    form2.Free;
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  showmessage('对不起您只有该程序的只读权限');
  exit;
 end;
if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 BEGIN
  dm.ADOConnection1.BeginTrans;
//  with dm.ADO2811 do
//   begin           //查找记事本
//    if active=true then active:=false;
//    Parameters[0].Value:=dm.aq0028.FieldValues['rkey'];
//    active:=true;
//    if not isempty then
//     delete;
//   end;

  dm.ADO28.Close;
  dm.ADO28.Parameters[0].Value := dm.aq0028.FieldValues['rkey'];
  dm.ADO28.open;

  with dm.ADOQuery2 do
   begin
    close;
    sql.Add('select PREF_SUPPLIER_PTR ');
    sql.Add('from data0017 inner join data0023');
    sql.Add('on data0017.PREF_SUPPLIER_PTR=data0023.rkey');
    sql.Add('where data0017.rkey='+dm.ADO28INVENTORY_PTR.AsString);
    sql.Add('and data0023.rkey='+dm.ADO28SUPPLIER_PTR.AsString);
    open;
    if not isempty then
     begin
      dm.ADO17.Close;
      dm.ADO17.Parameters[0].Value :=null;
      dm.ADO17.Parameters[1].Value :=dm.ADO28INVENTORY_PTR.Value;
      dm.ADO17.ExecSQL; //执行返加无结果的update语句修改材料首选供应商
     end;
   end;

 try
   with DM.ADOQuery2 do
   begin
     Close;
     SQL.Text:= 'delete from data0028_FileList where rkey28= ' + DM.ADO28RKEY.AsString;
     ExecSQL;
   end;
  dm.ADO28.Delete;
  dm.ADOConnection1.CommitTrans;
  dm.aq0028.Close;
  dm.aq0028.Open;
  dm.ADOQuery2.Close;
  dm.ADO17.Close;
 except
  messagedlg('数据删除不成功!',mtwarning,[mbcancel],0);
  dm.ADOConnection1.RollbackTrans;
 end;
 END;
end;

procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
 v_bar:string;
begin
if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.SimpleText)>5 then
   bar1.SimpleText:=copy(bar1.SimpleText,1,length(bar1.SimpleText)-1);
  if length(bar1.SimpleText)>5 then
   begin
    v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
    if (radiogroup1.ItemIndex=0) and (not dm.aq0028.IsEmpty) then
     if pos('*',dbgrid1.Columns[0].Title.caption)>0 then
      dm.aq0028.Filter := 'inv_part_number like '''+trim(v_bar)+'%'''
     else
      dm.aq0028.Filter := 'inv_part_description like '''+trim(v_bar)+'%'''
    else
    if (radiogroup1.ItemIndex=1) and (not dm.aq0028.IsEmpty) then
     if pos('*',dbgrid1.Columns[0].Title.caption)>0 then
      dm.aq0028.Filter := 'code like '''+trim(v_bar)+'%'''
     else
      dm.aq0028.Filter := 'supplier_name like '''+trim(v_bar)+'%'''
   end
  else
   dm.aq0028.Filter :='';
 end
else
if (key=chr(vk_return)) and (not dm.aq0028.IsEmpty) then    //如果按下了enter
   n2click(sender)           //调用编辑命令
 ELSE
  begin
   bar1.SimpleText := bar1.SimpleText+key;
   v_bar :=copy(bar1.SimpleText,6,length(bar1.SimpleText));
   if (radiogroup1.ItemIndex=0) and (not dm.aq0028.IsEmpty) then
    if pos('*',dbgrid1.Columns[0].Title.caption)>0 then
     dm.aq0028.Filter := 'inv_part_number like '''+trim(v_bar)+'%'''
    else
     dm.aq0028.Filter := 'inv_part_description like '''+trim(v_bar)+'%'''
   else
    if (radiogroup1.ItemIndex=1) and (not dm.aq0028.IsEmpty) then
     if pos('*',dbgrid1.Columns[0].Title.caption)>0 then
      dm.aq0028.Filter := 'code like '''+trim(v_bar)+'%'''
     else
      dm.aq0028.Filter := 'supplier_name like '''+trim(v_bar)+'%'''
  end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
 if not dm.aq0028.IsEmpty then
  n2click(sender);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (radiogroup1.ItemIndex=0) and (not dm.aq0028.IsEmpty) then
 begin
  if column.FieldName='inv_part_description' then
   begin
    column.Title.Caption:='* '+'材料描述';
    dbgrid1.Columns[0].Title.Caption:='材料号码';
    DM.aq0028.Sort:= column.FieldName;
    iChick:=1;
   end
  else
   if column.FieldName='inv_part_number' then
   begin
    column.Title.Caption:='* '+'材料号码';
    dbgrid1.Columns[1].Title.Caption:='材料描述';
    DM.aq0028.Sort:= column.FieldName;
    iChick:=0;
   end;
 end
else
 if (radiogroup1.ItemIndex=1) and (not dm.aq0028.IsEmpty) then
 if column.FieldName='supplier_name' then
   begin
    column.Title.Caption:='* '+'供应商姓名';
    dbgrid1.Columns[0].Title.Caption:='供应商代码';
    DM.aq0028.Sort:= column.FieldName;
    iChick:=1;
   end
 else
 if column.FieldName='code' then
   begin
    column.Title.Caption:='* '+'供应商代码';
    dbgrid1.Columns[1].Title.Caption:='供应商姓名';
    DM.aq0028.Sort:= column.FieldName;
    iChick:=0;
   end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.aq0028.SQL.Text);
end;


procedure TForm1.FormActivate(Sender: TObject);
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select employee_ptr from data0073');
   sql.Add('where rkey='+rkey73);
   open; 
   empl_ptr.Caption:=fieldvalues['employee_ptr'];
  end;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select getdate() as sys_date');
   open;
   sys_longdate:=formatdatetime('yyyy-mm-dd H:mm:ss',fieldvalues['sys_date']);
   sys_sortdate:=strtodate(datetostr(fieldvalues['sys_date']));
  end;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select QTE_CONTROL4 from data0192');
   open;
   dm.qte_price:=fieldbyname('QTE_CONTROL4').AsFloat;  //报价材料调价百分比
  end;
  iChick:=0;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbgrid1.SetFocus;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 str:string;
 pk:Tbookmark;
 lead_time:integer;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  showmessage('对不起您只有该程序的只读权限')
else
if messagedlg('您确定要一次更新供应商所有物料的交付时间吗?',mtconfirmation,[mbYes,mBno],0)=mryes then
 begin
  str:='';
  if inputquery('交货时间天数','请输入要更新的天数:            ',str) then
   if trim(str)<>'' then
    begin
     try
      lead_time:=strtoint(str);
      pk:=dm.aq0028.GetBookmark;
      dm.aq0028.DisableControls;
      dm.aq0028.First;
      while not dm.aq0028.Eof do
       begin
        dm.aq0028.Edit;
        dm.aq0028.FieldValues['lead_time']:=lead_time;
        dm.aq0028.Post;
        dm.aq0028.Next;
       end;
       dm.aq0028.UpdateBatch();
       dm.aq0028.GotoBookmark(pk);
       dm.aq0028.FreeBookmark(pk);
       dm.aq0028.EnableControls;
     except
      showmessage('对不起请输入一个有效的整数!');
     end;
    end;
 end;
end;


procedure TForm1.N4Click(Sender: TObject);

begin
  try
    form2:=tform2.Create(application);
    dm.ADO28.Close;
    dm.ADO28.Parameters[0].Value := dm.aq0028.FieldValues['rkey'];
    dm.ADO28.open;

    dm.qryFile.Close;
    dm.qryFile.Parameters[0].Value := DM.ADO28RKEY.Value;
    dm.qryFile.open;

    form2.Edit1.Text := dm.aq0028.FieldValues['inv_part_number'];
    form2.label9.Caption := dm.aq0028.FieldValues['inv_part_description'];
    form2.Edit1.Enabled := false;
    form2.BitBtn4.Enabled := false;
    form2.Edit2.Text := dm.aq0028.fieldvalues['code'];
    form2.label10.Caption := dm.aq0028.FieldValues['supplier_name'];
    form2.Edit2.Enabled := false;
    form2.BitBtn5.Enabled := false;
    form2.Edit3.Text := dm.aq0028.fieldvalues['curr_code'];
    form2.label11.Caption := dm.aq0028.FieldValues['curr_name'];
    form2.Edit3.Enabled := true;
    form2.BitBtn6.Enabled := true;
    form2.Edit5.Text := dm.aq0028.FieldValues['unit_code']; //采购单位
    form2.Label12.Caption := dm.aq0028.FieldValues['unit_name'];//采购单位
    Form2.Edit10.Text:=dm.aq0028model.AsString;
    Form2.Edit9.Text:=DM.aq0028qte_price2.Text;  //保存期限
    Form2.Edit9.Enabled:=False;
    form2.bitbtn1.Enabled:=false;
    form2.Edit3.Enabled:=false;
    form2.BitBtn6.Enabled:=false;
    form2.Edit5.Enabled:=false;
    form2.BitBtn7.Enabled:=false;
    form2.ComboBox2.Enabled:=false;
    form2.DBEdit1.ReadOnly:=true;
    form2.DBEdit2.ReadOnly:=true;
    form2.DBEdit6.ReadOnly:=true;
    form2.DBEdit7.ReadOnly:=true;
    form2.DBEdit3.ReadOnly:=true;
    form2.Edit6.ReadOnly:=true;
    form2.StringGrid1.Enabled:=false;
    form2.dbradiogroup1.Enabled:=false;  //购放方式
    form2.DBCheckBox1.ReadOnly:=true;
    form2.DBComboBox1.Enabled:=false;
    Form2.DBComboBox2.Enabled:=False;
    Form2.Memo1.ReadOnly:=False;
    if Trim(DM.aq0028CATALOG_NUM.Value)='Y' then
     Form2.CheckBox1.Checked:=True
    else
    Form2.CheckBox1.Checked:=False;
    form2.Edit10.Tag:=DM.aq0028prot_report_ptr.Value;
    Form2.DBEdit5.Enabled:=False;
    Form2.BitBtn2.Enabled:=False;//品牌供应商不可用

    form2.ShowModal;
  finally
  form2.free;
  end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
 begin
   if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    showmessage('对不起，您没有权限导出资料！')
  else
  begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := '物料供应信息';

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';
    if radiogroup1.ItemIndex=0 then
     mem.Add(#9+'供应商: '+edit1.Text+':'+label2.Caption)
    else
     mem.Add(#9+'材料: ' +edit2.Text+':'+label4.Caption);
     mem.Add('');
    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
        sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
    end;

    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets['物料供应信息'].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
    end;
  end;

procedure TForm1.N5Click(Sender: TObject);
begin
 form3:=tform3.Create(application);
 form3.ShowModal;
 form3.Free;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
form4:=tform4.Create(application);
form4.dtpk2.Date:=strtodate(datetostr(strtodatetime(self.sys_longdate)));
form4.dtpk1.Date:=form4.dtpk2.Date-30;
form4.dtpk1Exit(sender);
form4.ShowModal;
form4.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;


  self.Caption:=application.Title;

// rkey73:='1';
// vprev:='4';


  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  if RadioGroup1.ItemIndex=0 then
    BitBtn6.Enabled:=True
  else
    BitBtn6.Enabled:=False;
  
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   begin
    showmessage('对不起您只有该程序的只读权限');
    exit;
   end;
  try
    form_supp:=tform_supp.Create(application);
    Form_supp.ADOQuery1.Close;
    Form_supp.ADOQuery1.Open;
    if form_supp.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
      Exit;
    end
    else
    if form_supp.ShowModal=mrok then
    begin
      if Edit1.Text=form_supp.ADOQuery1.FieldValues['code'] then
      begin
        ShowMessage('旧供应商代码不能与新供应商代码相同');
        Exit;
      end;
      new_code.Caption:=form_supp.ADOQuery1.fieldbyname('code').AsString;
      new_name.Caption:=form_supp.ADOQuery1.fieldbyname('supplier_name').AsString;
      new_rkey.Caption := form_supp.ADOQuery1.fieldbyname('rkey').AsString;
      with dm.aq0028 do
      begin
        Active:=False;
        SQL.Delete(16);
        SQL.Delete(15);
        SQL.Add('data0028.supplier_ptr='+new_rkey.Caption);
        SQL.Add('order by inv_part_number');
        Prepared;
        Active:=True;
      end;
      if DM.aq0028.RecordCount=0 then
      begin
        try
          DM.ADOConnection1.BeginTrans;
          with dm.ADOQuery1 do
          begin
            Active:=False;
            SQL.Clear;
            sql.Add('INSERT INTO Data0028'+
                    '(SUPPLIER_PTR, INVENTORY_PTR, EMPLOYEE_PTR, CSI_USER_PTR, TDATE, SUPPLIER_PART_NO, SUGG_REORDER_QTY, LEAD_TIME,'+
                    'AMT_QUAN_FLAG, MIN_ORDER_QTY, MIN_ORDER_AMT, TAX_1, TAX_2, PRICE_1, PRICE_2, PRICE_3, PRICE_4, PRICE_5, PRICE_6,'+
                    'QUAN_VOL_1,QUAN_VOL_2, QUAN_VOL_3, QUAN_VOL_4, QUAN_VOL_5, DISC_1, DISC_2, DISC_3, DISC_4, DISC_5, DISC_6, TAX_3,'+
                    'TAX_4, PURCHASE_UNIT_PTR,CONVERSION_FACTOR, AVL_FLAG, CURRENCY_PTR, EDI_OUT_FORCST, qte_price, tax_flag, qte_price2,'+
                    'QTE_PRICE1, rohs, quote_type)  '+
                    'SELECT '+new_rkey.Caption+' AS  SUPPLIER_PTR, INVENTORY_PTR, EMPLOYEE_PTR, CSI_USER_PTR, TDATE, SUPPLIER_PART_NO, SUGG_REORDER_QTY,'+
                    'LEAD_TIME,AMT_QUAN_FLAG, MIN_ORDER_QTY, MIN_ORDER_AMT, TAX_1, TAX_2, PRICE_1, PRICE_2, PRICE_3, PRICE_4, PRICE_5, PRICE_6,'+
                    'QUAN_VOL_1,QUAN_VOL_2, QUAN_VOL_3, QUAN_VOL_4, QUAN_VOL_5, DISC_1, DISC_2, DISC_3, DISC_4, DISC_5, DISC_6, TAX_3, TAX_4,'+
                    'PURCHASE_UNIT_PTR,CONVERSION_FACTOR, AVL_FLAG, CURRENCY_PTR, EDI_OUT_FORCST, qte_price, tax_flag, qte_price2, QTE_PRICE1,'+
                    'rohs, quote_type FROM Data0028 AS Data0028_1 WHERE (SUPPLIER_PTR ='+supp_rkey.Caption+')');
            ExecSQL();
          end;
          DM.ADOConnection1.CommitTrans;
          ShowMessage('复制成功');
          Edit1.Text:=new_code.Caption;
          Label2.Caption:=new_name.Caption;
          with dm.aq0028 do
          begin
            Active:=False;
            SQL.Delete(16);
            SQL.Delete(15);
            SQL.Add('data0028.supplier_ptr='+new_rkey.Caption);
            SQL.Add('order by inv_part_number');
            Prepared;
            Active:=True;
          end;
        except
          ShowMessage('复制失败');
          DM.ADOConnection1.RollbackTrans;
        end;
      end
      else
      begin
        with dm.ADODataSet1 do
        begin
          Close;
          CommandText:='select SUPPLIER_PTR,INVENTORY_PTR,EMPLOYEE_PTR,CSI_USER_PTR,TDATE,SUPPLIER_PART_NO,'+
                       'SUGG_REORDER_QTY,LEAD_TIME,AMT_QUAN_FLAG,MIN_ORDER_QTY,MIN_ORDER_AMT,TAX_1,'+
                       'TAX_2,PRICE_1,PRICE_2,PRICE_3,PRICE_4,PRICE_5,PRICE_6,QUAN_VOL_1,QUAN_VOL_2,'+
                       'QUAN_VOL_3,QUAN_VOL_4,QUAN_VOL_5,DISC_1,DISC_2,DISC_3,DISC_4,DISC_5,DISC_6,TAX_3,'+
                       'TAX_4,PURCHASE_UNIT_PTR,CONVERSION_FACTOR,AVL_FLAG,CURRENCY_PTR,EDI_OUT_FORCST,'+
                       'qte_price,tax_flag,qte_price2,QTE_PRICE1, rohs, quote_type '+
                       'from data0028 where supplier_ptr='+new_rkey.Caption;
          sql_text:=CommandText;
        end;
        with dm.ADOQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select SUPPLIER_PTR,INVENTORY_PTR,EMPLOYEE_PTR,CSI_USER_PTR,TDATE,isnull(SUPPLIER_PART_NO,''''),SUGG_REORDER_QTY,LEAD_TIME,'+
                  'AMT_QUAN_FLAG,MIN_ORDER_QTY,MIN_ORDER_AMT,TAX_1, TAX_2,PRICE_1,PRICE_2,PRICE_3,PRICE_4,PRICE_5,PRICE_6,'+
                  'QUAN_VOL_1,QUAN_VOL_2,QUAN_VOL_3,QUAN_VOL_4,QUAN_VOL_5,DISC_1,DISC_2,DISC_3,DISC_4,DISC_5,DISC_6,TAX_3,'+
                  'TAX_4,PURCHASE_UNIT_PTR,CONVERSION_FACTOR,AVL_FLAG,CURRENCY_PTR,EDI_OUT_FORCST,qte_price,tax_flag,qte_price2,'+
                  'isnull(QTE_PRICE1,0) as QTE_PRICE1,isnull(rohs,'''') as rohs, quote_type from data0028 where supplier_ptr='+supp_rkey.Caption);
          Open;
          try
            dm.ADOConnection1.BeginTrans;
            First;
            while not Eof do
            begin
              dm.ADODataSet1.Close;
              DM.ADODataSet1.CommandText:=sql_text+' and inventory_ptr='+IntToStr(FieldValues['INVENTORY_PTR']);
              dm.ADODataSet1.Open;
              if DM.ADODataSet1.IsEmpty then
              begin
                DM.ADODataSet1.Append;
                DM.ADODataSet1SUPPLIER_PTR.Value:=StrToInt(new_rkey.Caption);
                DM.ADODataSet1INVENTORY_PTR.Value:=FieldValues['INVENTORY_PTR'];
                DM.ADODataSet1EMPLOYEE_PTR.Value:=FieldValues['EMPLOYEE_PTR'];
                DM.ADODataSet1CSI_USER_PTR.Value:=FieldValues['CSI_USER_PTR'];
                DM.ADODataSet1TDATE.Value:=FieldValues['TDATE'];
                DM.ADODataSet1SUPPLIER_PART_NO.Value:='';
                DM.ADODataSet1SUGG_REORDER_QTY.Value:=FieldValues['SUGG_REORDER_QTY'];
                DM.ADODataSet1LEAD_TIME.Value:=FieldValues['LEAD_TIME'];
                DM.ADODataSet1AMT_QUAN_FLAG.Value:=FieldValues['AMT_QUAN_FLAG'];
                DM.ADODataSet1MIN_ORDER_QTY.Value:=FieldValues['MIN_ORDER_QTY'];
                DM.ADODataSet1MIN_ORDER_AMT.Value:=FieldValues['MIN_ORDER_AMT'];
                DM.ADODataSet1TAX_1.Value:=FieldValues['TAX_1'];
                DM.ADODataSet1TAX_2.Value:=FieldValues['TAX_2'];
                DM.ADODataSet1PRICE_1.Value:=FieldValues['PRICE_1'];
                DM.ADODataSet1PRICE_2.Value:=FieldValues['PRICE_2'];
                DM.ADODataSet1PRICE_3.Value:=FieldValues['PRICE_3'];
                DM.ADODataSet1PRICE_4.Value:=FieldValues['PRICE_4'];
                DM.ADODataSet1PRICE_5.Value:=FieldValues['PRICE_5'];
                DM.ADODataSet1PRICE_6.Value:=FieldValues['PRICE_6'];
                DM.ADODataSet1QUAN_VOL_1.Value:=FieldValues['QUAN_VOL_1'];
                DM.ADODataSet1QUAN_VOL_2.Value:=FieldValues['QUAN_VOL_2'];
                DM.ADODataSet1QUAN_VOL_3.Value:=FieldValues['QUAN_VOL_3'];
                DM.ADODataSet1QUAN_VOL_4.Value:=FieldValues['QUAN_VOL_4'];
                DM.ADODataSet1QUAN_VOL_5.Value:=FieldValues['QUAN_VOL_5'];
                DM.ADODataSet1DISC_1.Value:=FieldValues['DISC_1'];
                DM.ADODataSet1DISC_2.Value:=FieldValues['DISC_2'];
                DM.ADODataSet1DISC_3.Value:=FieldValues['DISC_3'];
                DM.ADODataSet1DISC_4.Value:=FieldValues['DISC_4'];
                DM.ADODataSet1DISC_5.Value:=FieldValues['DISC_5'];
                DM.ADODataSet1DISC_6.Value:=FieldValues['DISC_6'];
                DM.ADODataSet1TAX_3.Value:=FieldValues['TAX_3'];
                DM.ADODataSet1TAX_4.Value:=FieldValues['TAX_4'];
                DM.ADODataSet1PURCHASE_UNIT_PTR.Value:=FieldValues['PURCHASE_UNIT_PTR'];
                DM.ADODataSet1CONVERSION_FACTOR.Value:=FieldValues['CONVERSION_FACTOR'];
                DM.ADODataSet1AVL_FLAG.Value:=FieldValues['AVL_FLAG'];
                DM.ADODataSet1CURRENCY_PTR.Value:=FieldValues['CURRENCY_PTR'];
                DM.ADODataSet1EDI_OUT_FORCST.Value:=FieldValues['EDI_OUT_FORCST'];
                DM.ADODataSet1qte_price.Value:=FieldValues['qte_price'];
                DM.ADODataSet1tax_flag.Value:=FieldValues['tax_flag'];
                DM.ADODataSet1qte_price2.Value:=FieldValues['qte_price2'];
                DM.ADODataSet1QTE_PRICE1.Value:=FieldValues['QTE_PRICE1'];
                DM.ADODataSet1rohs.Value:='';
                DM.ADODataSet1quote_type.Value:=FieldValues['quote_type'];
                DM.ADODataSet1.Post;
                Next;
              end
              else
                Next;
              if Eof then
              begin
                dm.ADOConnection1.CommitTrans;
                ShowMessage('复制成功');
                Edit1.Text:=new_code.Caption;
                Label2.Caption:=new_name.Caption;
                with dm.aq0028 do
                begin
                  Active:=False;
                  SQL.Delete(16);
                  SQL.Delete(15);
                  SQL.Add('data0028.supplier_ptr='+new_rkey.Caption);
                  SQL.Add('order by inv_part_number');
                  Prepared;
                  Active:=True;
                end;
              end;
            end;
          except
            on e:exception do
             application.MessageBox(pchar(e.Message),'Error',0);
          end;
        end;
      end;
    end;
  finally
    form_supp.free;
  end;
end;

procedure TForm1.BitBtn6Enter(Sender: TObject);
begin
  if Edit1.Text='' then
  begin
    ShowMessage('请先选择一个要复制材料明细的供应商代码');
    Edit1.SetFocus;
    Exit;
  end;
//  if DM.aq0028.IsEmpty then
//  begin
//    ShowMessage('此供应商没有材料明细，请确认供应商代码是否正确');
//    Edit1.SetFocus;
//    Exit;
//  end;
end;
procedure TForm1.Button2Click(Sender: TObject);
var
 InputVar: PDlgInput ;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  showmessage('对不起您只有该程序的只读权限')
else
if messagedlg('您确定要一次更新供应商所有物料的增值税率吗?',mtconfirmation,[mbYes,mBno],0)=mryes then
 begin
   with DM.ADOQuery1 do
   begin
     Close;
     sql.Clear;
     SQL.Add('select data0189.state_tax,data0189.state_id,data0024.* from data0024');
     SQL.Add('inner join data0189 on data0024.city_tax_ptr=data0189.rkey');
     SQL.Add('where data0024.supplier_ptr='+supp_rkey.Caption);
     Open;
   end;
   if DM.ADOQuery1.IsEmpty then
   begin
     MessageDlg('此供应商还没设置装运地点,不能同步更新税率!',mtInformation,[mbOK],1);
     Exit;
   end;
   if DM.ADOQuery1.RecordCount=1 then
    begin
      dm.aq0028.First;
      while not dm.aq0028.Eof do
       begin
        dm.aq0028.Edit;
        dm.aq0028.fieldbyname('TAX').Value:=dm.ADOQuery1.fieldbyname('state_tax').value;
        dm.aq0028.Post;
        dm.aq0028.Next;
       end;
       dm.aq0028.UpdateBatch();
       dm.aq0028.EnableControls;
       dm.aq0028.close;
       DM.aq0028.Open;
    end
   else
    begin
     frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
     try
     InputVar.Fields := 'factory_location/装运地点/100,state_tax/增值税率/100,factory_address_1/具体位置/300';
     InputVar.Sqlstr := 'select data0189.state_tax,data0189.state_id,data0024.* from data0024 inner join data0189 on data0024.city_tax_ptr=data0189.rkey where supplier_ptr='+supp_rkey.Caption;
     InputVar.AdoConn := dm.ADOConnection1;
     frmPick_Item_Single.InitForm_New(InputVar)  ;
      if frmPick_Item_Single.ShowModal=mrok then
      begin
       dm.aq0028.First;
       while not dm.aq0028.Eof do
       begin
        dm.aq0028.Edit;
        dm.aq0028.fieldbyname('TAX').Value:=frmPick_Item_Single.adsPick.fieldbyname('state_tax').value;
        dm.aq0028.Post;
        dm.aq0028.Next;
       end;
       dm.aq0028.UpdateBatch();
       dm.aq0028.EnableControls;
       dm.aq0028.close;
       DM.aq0028.Open;
      end;
     finally
     frmPick_Item_Single.adsPick.Close;
     frmPick_Item_Single.Free ;
     end;
    end;
 end;
end;

end.
