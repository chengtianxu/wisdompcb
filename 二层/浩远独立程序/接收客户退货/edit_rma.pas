unit edit_rma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Mask, DBCtrls, Menus, Grids,
  ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBEdit6: TDBEdit;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Edit4: TEdit;
    BitBtn6: TBitBtn;
    Edit5: TEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    BitBtn7: TBitBtn;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ADOQuery2: TADOQuery;
    Label17: TLabel;
    ADOQuery3: TADOQuery;
    Label19: TLabel;
    Edit7: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    StringGrid1: TStringGrid;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1RMA_NUMBER: TStringField;
    ADOQuery1CUSTOMER_PART_PTR: TIntegerField;
    ADOQuery1AUTH_BY_EMPL_PTR: TIntegerField;
    ADOQuery1CSI_USER_PTR: TIntegerField;
    ADOQuery1SHIPMENT_PTR: TIntegerField;
    ADOQuery1CUSTOMER_PTR: TIntegerField;
    ADOQuery1SO_PTR: TIntegerField;
    ADOQuery1NOTE_PAD_PTR: TIntegerField;
    ADOQuery1RMA_DATE: TDateTimeField;
    ADOQuery1QTY_AUTH: TIntegerField;
    ADOQuery1QTY_RECD: TIntegerField;
    ADOQuery1QTY_SHIPD: TIntegerField;
    ADOQuery1QTY_CRED: TIntegerField;
    ADOQuery1QTY_SCRAP: TIntegerField;
    ADOQuery1QTY_TO_BE_SHIPPED: TIntegerField;
    ADOQuery1QTY_TO_BE_CREDITED: TIntegerField;
    ADOQuery1QTY_TO_BE_REWORKED: TIntegerField;
    ADOQuery1RMA_STATUS: TSmallintField;
    ADOQuery1QTY_REWORKED: TIntegerField;
    ADOQuery1QTY_TO_BE_REMAKED: TIntegerField;
    ADOQuery1QTY_REMAKED: TIntegerField;
    ADOQuery1QTY_TO_MOVE_FIN_GOOD: TIntegerField;
    ADOQuery1ANALYSIS_CODE_1: TStringField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1ANALYSIS_CODE_3: TStringField;
    ADOQuery1ANALYSIS_CODE_4: TStringField;
    ADOQuery1ANALYSIS_CODE_5: TStringField;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    rkey101: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    ADOQuery1QTY_SHIP: TIntegerField;
    ADOQuery1sys_date: TDateTimeField;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    dbrgrprma_type: TDBRadioGroup;
    ADOQuery1rma_type: TWordField;
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure save_note();
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1Exit(Sender: TObject);
    function  if_rkey64(rkey64:integer): boolean;
    procedure post_120(rkey98:integer);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
   v_close:byte; 
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  quote:tstringlist;
implementation
uses main, cust_search, part_search, so_search, ship_no, note, damo,
  analysis, tou_shu,common;
{$R *.dfm}

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 adoquery1.Cancel;
 v_close:=1;
 close;
end;

procedure TForm2.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
 if key=chr(46) then abort;   //不允许输入小数点'.'
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
stringgrid1.Cells[0,0]:='指派批次';
stringgrid1.Cells[1,0]:='指派员工';
stringgrid1.Cells[2,0]:='装运日期';
stringgrid1.Cells[3,0]:='可用数量';
stringgrid1.Cells[4,0]:='退货数量';
stringgrid1.Cells[5,0]:='rkey64';

if adoquery1.State=dsedit then       //编辑
 begin
  Edit6.Text:=dm.ADOQuery1warehouse_name.AsString;
  with adoquery2 do
  begin           //查找记事本
   active:=false;
   sql.Clear;
   sql.Add('select * from data0011');
   sql.Add('where SOURCE_TYPE=98');
   sql.Add('and FILE_POINTER='+ADOquery1.fieldbyname('rkey').AsString);
   active:=true;
   if not adoquery2.IsEmpty then
    quote.Text:=adoquery2.FieldValues['memo_text'];
  end;
  if adoquery1.FieldValues['so_ptr']<>null then //按订单退货
   begin
    with adoquery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select data0064.rkey,shipment_no,date_shipped,');
     sql.Add('quan_shipped-quan_credited+qty_send as qty_avl,');
     sql.Add('data0005.employee_name,data0120.qty_send');
     sql.Add('from data0120 inner join data0064 on');
     sql.Add('data0120.ship_ptr=data0064.rkey ');
     sql.Add('inner join data0005 on');
     sql.Add('data0064.ENT_EMPL_PTR=data0005.rkey');
     sql.Add('where data0120.rma_ptr='+ADOQuery1RKEY.AsString);
     open;
    end;

    while not adoquery2.Eof do
     begin
     stringgrid1.Cells[0,stringgrid1.RowCount-1]:=adoquery2.fieldbyname('shipment_no').AsString;
     stringgrid1.Cells[1,stringgrid1.RowCount-1]:=adoquery2.fieldbyname('employee_name').AsString;
     stringgrid1.Cells[2,stringgrid1.RowCount-1]:=adoquery2.fieldbyname('date_shipped').AsString;
     stringgrid1.Cells[3,stringgrid1.RowCount-1]:=adoquery2.fieldbyname('qty_avl').AsString;
     stringgrid1.Cells[4,stringgrid1.RowCount-1]:=adoquery2.fieldbyname('qty_send').AsString;
     stringgrid1.Cells[5,stringgrid1.RowCount-1]:=adoquery2.fieldbyname('rkey').AsString;
     stringgrid1.RowCount:=stringgrid1.RowCount+1;
     adoquery2.Next;
     end;
   end;
 end
else //新增
 begin
  self.ADOQuery1NOTE_PAD_PTR.Value:=1;
  self.Edit3.Text:=dm.EMPLOYEE_name;
 end;

end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit5.Text);
  if frmcustsearch.ADOQuery1.IsEmpty then
   begin
     application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+
     mb_iconstop+mb_systemmodal);
    edit5.SetFocus;
   end
  else
  if frmcustsearch.ShowModal=mrok then
   begin
    if strtoint(label15.Caption)<> frmcustsearch.ADOQuery1.FieldValues['rkey'] then
    begin
    EDIT5.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
    edit5.Font.Color := clwindowtext;
    edit4.SetFocus;
    label14.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
    label15.Caption := frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
    edit4.Text:='';
    label13.Caption:='';
    label16.Caption:='';
    edit1.Text:='';
    label17.Caption:='';
    end;
   end
  else
   edit5.SetFocus;
 finally
  frmcustsearch.free;
 end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
  try
    frmcustpart:=Tfrmcustpart.Create(application);
    if label15.Caption<>'0' then
    with frmcustpart.ADOQuery1 do
    begin
      active:=false;
      sql.Clear;
      sql.Add('select data0025.rkey,manu_part_number,manu_part_desc,ANALYSIS_CODE_2,customer_ptr,');
      sql.Add('data0015.abbr_name');
      sql.Add('from data0025 inner join data0015');
      sql.Add('on data0025.PROD_ROUTE_PTR=data0015.rkey');
      sql.Add('where parent_ptr is null');
      sql.Add('and customer_ptr='+label15.Caption);
      sql.add('order by manu_part_number');
      active:=true;
    end
    else
      frmcustpart.adoquery1.Open;
    frmcustpart.Edit1.Text := trim(edit4.Text);
    if frmcustpart.ADOQuery1.IsEmpty then
    begin
      application.MessageBox('没有找到相关的记录!','程序确认',mb_OK+
      mb_iconstop+mb_systemmodal);
      edit4.SetFocus;
      exit;
    end;
    if frmcustpart.ShowModal=mrok then
    begin
      EDIT4.Text := trim(frmcustpart.ADOQuery1.FieldValues['manu_part_number']);
      edit4.Font.Color := clwindowtext;
      label13.Caption := frmcustpart.ADOQuery1.FieldValues['manu_part_desc'];
      label16.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
      Edit6.Text :=  frmcustpart.ADOQuery1abbr_name.Value;
      edit1.Text:='';
      label17.Caption:='';
      if label15.Caption='0' then
      with ADOQuery2 do
      begin
        active:=false;
        sql.Clear;
        sql.Add('select rkey,cust_code,customer_name from data0010');
        sql.Add('where rkey='+frmcustpart.ADOQuery1.fieldbyname('customer_ptr').AsString);
        active:=true;
        EDIT5.Text := trim(FieldValues['cust_code']);
        edit5.Font.Color := clwindowtext;
        label14.Caption := FieldValues['customer_name'];
        label15.Caption := fieldbyname('rkey').AsString;
      end;
      dbedit6.SetFocus;
    end
    else
      edit4.SetFocus;
  finally
    frmcustpart.free;
  end;
end;

procedure TForm2.Edit5Click(Sender: TObject);
begin
if edit5.Font.Color=clwindowtext then
 begin
  edit5.SelectAll;
  edit5.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit5Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn7') and (trim(edit5.Text)<>'') then
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit5.Text);
 if Comparetext(trim(edit5.Text),trim(frmcustsearch.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
   begin
    if strtoint(label15.Caption)<> frmcustsearch.ADOQuery1.FieldValues['rkey'] then
    begin
     edit5.Font.Color := clwindowtext;
     label14.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
     label15.Caption := frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
     edit4.Text:='';
     label13.Caption:='';
     label16.Caption:='';
     edit1.Text:='';
     label17.Caption:='';
    end;
   end
 else
   begin
    messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
    edit5.SetFocus;
   end;
 finally
  frmcustsearch.free;
 end
else
 begin
  label14.Caption := '';
  label15.Caption := '0';
 end;
end;

procedure TForm2.Edit4Click(Sender: TObject);
begin
if edit4.Font.Color=clwindowtext then
 begin
  edit4.SelectAll;
  edit4.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') and (trim(edit4.Text)<>'') then
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  if label15.Caption<>'0' then
   with frmcustpart.ADOQuery1 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('select data0025.rkey,manu_part_number,manu_part_desc,ANALYSIS_CODE_2,customer_ptr,');
     sql.Add('data0015.abbr_name');
     sql.Add('from data0025 inner join data0015');
     sql.Add('on data0025.PROD_ROUTE_PTR=data0015.rkey');
     sql.Add('where parent_ptr is null');
     sql.Add('and customer_ptr='+label15.Caption);
     sql.add('order by manu_part_number');
     active:=true;
    end
   else
    frmcustpart.adoquery1.Open; 
  frmcustpart.Edit1.Text := trim(edit4.Text);
  if Comparetext(trim(edit4.Text),trim(frmcustpart.ADOQuery1.Fieldbyname('manu_part_number').AsString))=0 then
   begin
    edit4.Font.Color := clwindowtext;
    label13.Caption := frmcustpart.ADOQuery1.FieldValues['manu_part_desc'];
    label16.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
    Edit6.Text :=  frmcustpart.ADOQuery1abbr_name.Value;
    edit1.Text:='';
    label17.Caption:='';
    if label15.Caption='0' then
     with ADOQuery2 do
     begin
      if active=true then active:=false;
      sql.Clear;
      sql.Add('select rkey,cust_code,customer_name from data0010');
      sql.Add('where rkey='+frmcustpart.ADOQuery1.fieldbyname('customer_ptr').AsString);
      active:=true;
      EDIT5.Text := trim(FieldValues['cust_code']);
      edit5.Font.Color := clwindowtext;
      label14.Caption := FieldValues['customer_name'];
      label15.Caption := fieldbyname('rkey').AsString;
     end;
   end
  else
   begin
    messagedlg('请输入正确的客户部品!',mtinformation,[mbcancel],0);
    edit4.SetFocus;
   end;
 finally
  frmcustpart.free;
 end
else
 begin
  label13.Caption := '';
  label16.Caption := '';
  Edit6.Text := '';
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
  if trim(edit5.Text)='' then
  begin
    showmessage('请首先确定客户编号!');
    edit5.SetFocus;
  end
  else
  try
    form_salesorder:=tform_salesorder.Create(application);
    if form_salesorder.ShowModal=mrok then
    begin
     if trim(Label16.Caption)<>'' then
      if strtoint(trim(label16.Caption))<> form_salesorder.ADOQuery1cust_part_ptr.Value then
       begin
        messagedlg('订单中的本厂编号与已选择的本厂编号不一致!!!',mterror,[mbcancel],0);
        exit;
       end
      else
     else
       begin
        edit4.Text := form_salesorder.ADOQuery1MANU_PART_NUMBER.Value;
        edit4.Font.Color := clwindowtext;
        label13.Caption := form_salesorder.ADOQuery1manu_part_desc.Value;
        label16.Caption := form_salesorder.ADOQuery1.fieldbyname('cust_part_ptr').AsString;
       end;
      edit1.Text := trim(form_salesorder.ADOQuery1SALES_ORDER.Value);
      edit1.Font.Color := clwindowtext;
      Edit6.Text := form_salesorder.ADOQuery1abbr_warehousename.Value;
      label17.Caption := form_salesorder.ADOQuery1.fieldbyname('rkey').AsString;
      edit7.Text := form_salesorder.ADOQuery1PO_NUMBER.Value;
      stringgrid1.SetFocus;
    end
    else
      edit1.SetFocus;
  finally
    form_salesorder.free;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 quote:=tstringlist.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 quote.Free;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 v_seed,v_last,new_seed:string;
 v_length,i,control_no:word;
 rkey98:integer;
begin
if rkey101.Caption='' then
if messagedlg('投诉编号为空是否继续?',mtConfirmation,[mbYes,mbNo],0)=mrno then
begin
 edit2.SetFocus;
 exit;
end;

 dm.ADOConnection1.BeginTrans;  //启用事物处理
 adoquery1.FieldByName('customer_ptr').AsString:=label15.Caption;
 adoquery1.FieldByName('customer_part_ptr').AsString:=label16.Caption;
 if rkey101.Caption<>'' then //投诉编号
 self.ADOQuery1SHIPMENT_PTR.AsString:=rkey101.Caption;
 self.ADOQuery1RMA_STATUS.Value:=1;
 
if adoquery1.State=dsedit then  //编辑
 begin
  try
   save_note;
   adoquery1.FieldByName('csi_user_ptr').AsString := rkey73;
   adoquery1.Fieldvalues['auth_by_empl_ptr'] := user_ptr;
   adoquery1.Post;
   self.post_120(self.ADOQuery1RKEY.Value);
   dm.ADOConnection1.CommitTrans;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据保存失败请检查编号是否得复!',mtinformation,[mbok],0);
   exit;
  end;
  rkey98:=dm.ADOQuery1rkey.Value;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.open;
  dm.ADOQuery1.Locate('rkey',rkey98,[]);
  v_close:=1;
  ModalResult:=mrok;
 end
else                    //新增
 begin
  if edit1.Visible then //按销售定单开的 RMA
   adoquery1.FieldByName('so_ptr').AsString:=label17.Caption;   //SO指针
  adoquery1.FieldValues['qty_recd'] := 0;
  ADOQuery1.FieldValues['qty_scrap'] := 0;
  ADOQuery1.FieldValues['qty_to_move_fin_good'] := 0;   //待入库
  ADOQuery1.FieldValues['qty_to_be_reworked'] := 0;   //返工
  ADOQuery1.FieldValues['qty_to_be_remaked'] := 0;   //重制
  adoquery1.FieldByName('csi_user_ptr').AsString := rkey73;
  adoquery1.Fieldvalues['auth_by_empl_ptr'] := user_ptr;
 try
   adoquery1.Post;
   for i:=1 to stringgrid1.RowCount-2 do
    begin
     with adoquery2 do
      begin
      close;
      sql.Clear;
      sql.Add('update data0064');
      sql.Add('set QUAN_CREDITED = QUAN_CREDITED+'+stringgrid1.Cells[4,i]);
      sql.Add('where rkey= '+stringgrid1.Cells[5,i]);
      ExecSQL;
      end;
     with adoquery3 do
      begin
       close;
       sql.Clear;
       sql.Add('insert into data0120 (rma_ptr,ship_ptr,qty_send)');
       sql.Add('values ('+ADOQuery1RKEY.AsString+','+stringgrid1.Cells[5,i]+','+stringgrid1.Cells[4,i]+')');
       ExecSQL;
      end;
    end;

   save_note;   //保存记事本
   dm.ADOConnection1.CommitTrans;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据保存失败请检查编号是否得复!',mtinformation,[mbok],0);
   exit;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
if dm.AQ04SEED_FLAG.Value<>1 then
 begin
  v_seed := trim(dbedit7.Field.Value);
  v_length :=length(v_seed);
  control_no:=dm.AQ04CONTROL_NO_LENGTH.Value;
  if v_seed>= trim(dm.AQ04.FieldValues['seed_value']) then
  for i := v_length downto 1 do                           //更新data0004
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then//如果不是数字
  begin
   v_last := floattostr(1000000000+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
   new_seed := copy(v_seed,1,i)+copy(v_last,control_no-(v_length-i)+1,v_length-i);
   dm.AQ04.Edit;          //使前缀不变后缀加1
   dm.AQ04.FieldValues['seed_value'] := new_seed;
   dm.AQ04.Post;
   break;
  end
 else
 if i=1 then //如果第一位仍然是数字
  begin
   v_last := floattostr(10000000000+strtofloat(v_seed)+1);
   new_seed := copy(v_last,control_no+1-v_length+1,v_length);
   dm.AQ04.Edit;
   dm.AQ04.FieldValues['seed_value'] := new_seed;
   dm.AQ04.Post;
  end;
 end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  rkey98:=adoquery1.FieldValues['rkey'];
  dm.ADOQuery1.close;
  dm.ADOQuery1.Open;
  dm.ADOQuery1.Locate('rkey',rkey98,[]);
  v_close:=1;
  ModalResult:=mrok;
 end;
end;

procedure Tform2.save_note;
begin
 with adoquery2 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select * from data0011');
   sql.Add('where SOURCE_TYPE=98 and');
   sql.Add('FILE_POINTER='+ADOquery1.fieldbyname('rkey').AsString);
   active:=true;
  end;
 if (not adoquery2.IsEmpty) and (trim(quote.Text)<>'') then
  begin
   adoquery2.Edit;
   adoquery2.FieldValues['memo_text']:=quote.Text;
   adoquery2.post
  end
 else
  if (not adoquery2.IsEmpty) and (trim(quote.Text)='') then
   adoquery2.Delete
  else
   if (adoquery2.IsEmpty) and (trim(quote.Text)<>'') then
    begin
     adoquery2.append;
     adoquery2.FieldValues['file_pointer'] := adoquery1.FieldValues['rkey'];
     adoquery2.FieldValues['source_type'] := 98;
     adoquery2.FieldValues['memo_text'] := quote.Text;
     adoquery2.post;
    end;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if (trim(dbedit6.Text)='') or (dbedit6.Field.Value=0) then
 begin
  messagedlg('请输入退货数量!',mtinformation,[mbcancel],0);
  dbedit6.SetFocus;
  exit;
 end;
if edit1.Visible then     //如果是按销售定单退货
 begin
  if trim(edit1.Text)='' then
   begin
    messagedlg('请输入正确的销售定单!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
    exit;
   end;
 end
else
 begin
  if trim(edit5.Text)='' then
   begin
    messagedlg('请输入正确的客户号码!',mtinformation,[mbcancel],0);
    edit5.SetFocus;
    exit;
   end;
  if trim(edit4.Text)='' then
   begin
    messagedlg('请输入正确的客户部件!',mtinformation,[mbcancel],0);
    edit4.SetFocus;
    exit;
   end;
 end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then
 adoquery1.Cancel;  
end;

procedure TForm2.N1Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  if not bitbtn1.Visible then
   begin
    edit_note.Button1.Visible := false;
    edit_note.Button2.Visible := false;
    edit_note.Button3.Visible := true;
    edit_note.BitBtn1.Visible := false;
    edit_note.Memo1.ReadOnly := true;
    edit_note.Memo1.Color := cl3dlight;
   end;
  edit_note.Caption:='RMA记事本:'+dbedit7.Text;
  edit_note.Memo1.Lines.Assign(quote);
  if edit_note.ShowModal=mrok then quote.Text:=edit_note.Memo1.Text;
  finally
  edit_note.free;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.N2Click(Sender: TObject);
begin
form5:=tform5.Create(application);
if not bitbtn1.Visible then
 begin
  form5.DBEdit1.Enabled:=false;
  form5.DBEdit2.Enabled:=false;
  form5.DBEdit3.Enabled:=false;
  form5.DBEdit4.Enabled:=false;
  form5.DBEdit5.Enabled:=false;
 end;
form5.ShowModal;
form5.Free;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
if trim(label17.Caption)='' then
 begin
  showmessage('请先选择销售订单!');
  exit;
 end;

 dm.ADO64.Close;
 dm.ADO64.Parameters[0].Value:=strtoint(label17.Caption);
 dm.ADO64.Open;
 
if dm.ADO64.IsEmpty then
 showmessage('该销售订单没有出货记录!')
else
begin
form3:=tform3.Create(application);
if form3.ShowModal=mrok then
 begin
  if if_rkey64(dm.ADO64rkey.Value) then
   showmessage('退货指派记录重复!')
  else
   begin
    stringgrid1.Cells[0,stringgrid1.RowCount-1] := dm.ADO64shipment_no.AsString;
    stringgrid1.Cells[1,stringgrid1.RowCount-1] := dm.ADO64employee_name.Value;
    stringgrid1.Cells[2,stringgrid1.RowCount-1] := dm.ADO64date_shipped.AsString;
    stringgrid1.Cells[3,stringgrid1.RowCount-1] := dm.ADO64qty_aval.AsString;
    stringgrid1.Cells[4,stringgrid1.RowCount-1] := dm.ADO64qty_aval.AsString;
    stringgrid1.Cells[5,stringgrid1.RowCount-1] := dm.ADO64rkey.AsString;
    stringgrid1.RowCount := stringgrid1.RowCount+1;
    ADOQuery1QTY_AUTH.Value :=ADOQuery1QTY_AUTH.Value+dm.ADO64qty_aval.Value;
    ADOQuery1QTY_SHIP.Value:=ADOQuery1QTY_AUTH.Value;

    bitbtn4.Enabled:=false;
    bitbtn6.Enabled:=false;
    bitbtn7.Enabled:=false;
    edit5.Enabled:=false;
    edit4.Enabled:=false;

   end;
 end;
form3.Free;
end;
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (acol=4) and (arow<>stringgrid1.RowCount-1) then canselect:=true
else canselect:=false;
end;

procedure TForm2.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if stringgrid1.RowCount=2 then abort;
if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm2.N4Click(Sender: TObject);
var
 i:integer;
begin
 ADOQuery1QTY_AUTH.Value :=ADOQuery1QTY_AUTH.Value-strtoint(stringgrid1.Cells[4,stringgrid1.row]);
 ADOQuery1QTY_SHIP.Value:=ADOQuery1QTY_AUTH.Value;
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
{if stringgrid1.RowCount=2 then
 begin
  bitbtn4.Enabled:=true;
  bitbtn6.Enabled:=true;
  bitbtn7.Enabled:=true;
  edit5.Enabled:=true;
  edit4.Enabled:=true;
 end;}//因编辑修改订单后不能正常保存，13-11-12 屏蔽掉编辑时改订单的功能。lch
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
if bitbtn1.Visible then
begin
if stringgrid1.RowCount=2 then
 n4.Enabled:=false
else
 n4.Enabled:=true;
end
else
 begin
  n3.Enabled:=false;
  n4.Enabled:=false;
 end;
end;

procedure TForm2.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 i:integer;
 total:integer;
begin
if stringgrid1.RowCount > 2 then
 begin
  if (stringgrid1.Cells[4,stringgrid1.Row]='') then stringgrid1.Cells[4,stringgrid1.Row]:='0';
  if strtofloat(stringgrid1.Cells[4,stringgrid1.row]) > strtofloat(stringgrid1.Cells[3,stringgrid1.row]) then
  stringgrid1.Cells[4,stringgrid1.row]:=stringgrid1.Cells[3,stringgrid1.row];
  total:=0;
  for i:=1 to stringgrid1.RowCount-2 do total:=total+strtoint(stringgrid1.cells[4,i]);
  ADOQuery1QTY_AUTH.Value :=total;
  ADOQuery1QTY_SHIP.Value:=ADOQuery1QTY_AUTH.Value;
 end;
end;

procedure TForm2.StringGrid1Exit(Sender: TObject);
var
 i:word;
begin
 if (activecontrol.Name<>'BitBtn3') then
  begin
   for i:=1 to stringgrid1.RowCount-2 do
   if strtofloat(stringgrid1.Cells[4,i])=0 then
   begin
    messagedlg('退货的数量必须大于零!',mtinformation,[mbok],0);
    stringgrid1.SetFocus;
    break;
   end;
  end;
end;

function  tform2.if_rkey64(rkey64:integer): boolean;
var
 i:integer;
begin
if_rkey64:=false;
 for i := 1 to stringgrid1.RowCount-2 do //比较是否重复
  if strtoint(stringgrid1.Cells[5,i]) = rkey64 then
   begin
    if_rkey64:=true;
    break;
   end;
end;

procedure TForm2.post_120(rkey98: integer);
var
 i,rkey120:integer;
begin
for i:=1 to stringgrid1.RowCount-2 do
 begin
  with adoquery3 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0120');
    sql.Add('where rma_ptr='+inttostr(rkey98));
    sql.Add('and ship_ptr='+stringgrid1.Cells[5,i]);
    open;
   end;
  if adoquery3.IsEmpty then  //新增退货指派
   begin
    adoquery3.Append;
    adoquery3.FieldValues['rma_ptr']:=rkey98;
    adoquery3.FieldValues['ship_ptr']:=strtoint(stringgrid1.Cells[5,i]); //64
    adoquery3.FieldValues['qty_send']:=strtoint(stringgrid1.Cells[4,i]);
    adoquery3.Post;
    with adoquery2 do
     begin
      close;
      sql.Clear;
      sql.Add('update data0064');
      sql.Add('set QUAN_CREDITED=QUAN_CREDITED+'+stringgrid1.Cells[4,i]);
      sql.Add('where rkey='+stringgrid1.Cells[5,i]);
      ExecSQL;
     end;
   end
  else //编辑原指派
   begin
    with adoquery2 do
     begin
      close;
      sql.Clear;
      sql.Add('select QUAN_CREDITED from data0064');
      sql.Add('where rkey='+stringgrid1.Cells[5,i]);
      open;
      edit;
      fieldvalues['QUAN_CREDITED']:=fieldvalues['QUAN_CREDITED']-
                                    adoquery3.FieldValues['qty_send']+
                                    strtoint(stringgrid1.Cells[4,i]);
      post;
     end;
    adoquery3.Edit;
    adoquery3.FieldValues['qty_send']:=strtoint(stringgrid1.Cells[4,i]);
    adoquery3.Post;
   end;
 end; //结束编辑或删除-正向搜索

with dm.ADOQuery2 do
 begin
  close;
  sql.Clear;
  sql.Add('select * from data0120');
  sql.Add('where rma_ptr='+inttostr(rkey98));
  open;
 end;

while not dm.ADOQuery2.Eof do
 begin
  rkey120:=dm.ADOQuery2.FieldValues['rkey'];
  for i:=1 to stringgrid1.RowCount-2 do
   if strtoint(stringgrid1.Cells[5,i])=dm.ADOQuery2.FieldValues['ship_ptr'] then
    break
   else
    if i=stringgrid1.RowCount-2  then
     begin
      with adoquery2 do
       begin
        close;
        sql.Clear;
        sql.Add('update data0064');
        sql.Add('set QUAN_CREDITED=QUAN_CREDITED-'+dm.ADOQuery2.fieldbyname('qty_send').AsString);
        sql.Add('where rkey='+dm.ADOQuery2.fieldbyname('ship_ptr').AsString);
        ExecSQL;
       end;
      dm.ADOQuery2.Delete;
     end;
  if rkey120 = dm.ADOQuery2.FieldValues['rkey'] then dm.ADOQuery2.Next;
 end;

end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
if label16.Caption<>'' then
begin
 form4:=tform4.Create(application);
 form4.ADOQuery1.Close;
 form4.ADOQuery1.Parameters[0].Value:=strtoint(label16.Caption);
 form4.ADOQuery1.Open;
 if not form4.adoquery1.IsEmpty then
 if form4.ShowModal=mrok then
  begin
   edit2.Text:=trim(form4.ADOQuery1LOG_NUMBER.Value);
   edit2.Font.Color:=clwindowText;
   rkey101.Caption:=form4.ADOQuery1rkey.AsString;
  end
 else
  edit2.SetFocus
 else
   showmessage('没有找到对应板号的投诉编号!');
 form4.Free;
end
else
 showmessage('请首选择本厂编号!');
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5') and
   (activecontrol.Name<>'BitBtn3') and
   (trim(edit2.Text)<>'') then
 begin
 if label16.Caption<>'' then
  begin
  form4:=tform4.Create(application);
  form4.ADOQuery1.Close;
  form4.ADOQuery1.Parameters[0].Value:=strtoint(label16.Caption);
  form4.ADOQuery1.Open;
  form4.Edit1.Text:=edit2.Text;
  if Comparetext(trim(edit2.Text),trim(form4.ADOQuery1LOG_NUMBER.Value))=0 then
   begin
    edit2.Text:=trim(form4.ADOQuery1LOG_NUMBER.Value);
    edit2.Font.Color:=clwindowText;
    rkey101.Caption:=form4.ADOQuery1rkey.AsString;
   end
  else
    begin
     showmessage('没有找到对应板号的投诉编号!');
     edit2.SetFocus;
    end;
  form4.Free;
  end
  else
   begin
    edit2.Text:='';
    showmessage('请首先输入板号资料!');
   end;
 end
else
if (activecontrol.Name<>'BitBtn5') and
   (activecontrol.Name<>'BitBtn3') and
   (trim(edit2.Text)='') then
 begin
  edit2.Font.Color:=clblue;
  rkey101.Caption:='';
 end;
end;

procedure TForm2.DBEdit1Exit(Sender: TObject);
begin
if self.ADOQuery1QTY_SHIP.Value>self.ADOQuery1QTY_AUTH.Value then
 begin
  dbedit1.SetFocus;
  showmessage('交货数量不能大于退货数量');
  
 end;
end;

end.
