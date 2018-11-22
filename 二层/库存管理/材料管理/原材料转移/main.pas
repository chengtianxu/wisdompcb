unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, Grids, ImgList, Menus,math;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    SGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox4: TComboBox;
    Label7: TLabel;
    Edit4: TEdit;
    SpeedButton1: TSpeedButton;
    SGrid2: TStringGrid;
    key15: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    key15_1: TLabel;
    key23: TLabel;
    key01: TLabel;
    db_ptr: TLabel;
    Label3: TLabel;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }

   procedure update_main();
   function find_soerror(number:string):boolean;
   procedure update_04(v_seed: string);
   function findinvt_counting():string;
  public
  employee_name :string;
  sys_longdate :string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,invser_form,outnum_form
   ,common;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;


 //user_ptr := '73'; //用户05
  //vprev := '4';     //用户权限
 //dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat:='yyyy-mm-dd';
  self.SGrid1.Cells[0,0]:='入仓数量';
  self.SGrid1.Cells[1,0]:='单位';
  self.SGrid1.Cells[2,0]:='价格';
  self.SGrid1.Cells[3,0]:='材料规格';
  self.SGrid1.Cells[4,0]:='材料名称';
  self.SGrid1.Cells[5,0]:='转入仓库';
  sgrid2.Cells[0,0]:='data22.rkey';
  sgrid2.Cells[1,0]:='data456.rkey';
  sgrid2.Cells[2,0]:='原库存';
  sgrid2.Cells[3,0]:='新仓库指针';
end;

//=====================使主截面恢复到原始状态======================
procedure tform1.update_main();
begin
 combobox1.Enabled:=true;
 combobox2.Enabled:=true;
 combobox1.ItemIndex:=0;
 combobox2.ItemIndex:=-1;
 edit1.Clear;
 edit2.Clear;
 edit3.Clear;
 edit4.Clear;
 edit5.Clear;

  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  sgrid1.Rows[1].Clear;
  sgrid2.Rows[1].Clear;

  combobox1.SetFocus;
end;

function tform1.find_soerror(number:string):boolean;
begin
  with dm.ADOQ do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0456');
   sql.Add('where GRN_NUMBER='''+number+'''');
   open;
   result:= not IsEmpty ;
  end;
end;

procedure tform1.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04.Edit; //使前缀不变后缀加1
    dm.ado04SEED_VALUE.Value := new_seed;
    dm.ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04.Edit;
     dm.ado04SEED_VALUE.Value := new_seed;
     dm.ado04.Post;
    end;
end;

function TForm1.findinvt_counting: string;
begin
 with dm.adoq do
 begin
  close;
  sql.Text:='SELECT top 1 dbo.Data0092.PHY_COUNT_NO, dbo.Data0092.TDATE,'+#13+
      'dbo.Data0005.EMPLOYEE_NAME'+#13+
      'FROM dbo.Data0005 INNER JOIN'+#13+
      'dbo.Data0092 ON dbo.Data0005.RKEY = dbo.Data0092.EMPLOYEE_PTR'+#13+
      'WHERE (dbo.Data0092.STATUS = ''0'')';
  open;
  if not isempty then
   result:='仓库正在进行材料盘点暂时不能操作该程序,盘点代码:'+
            fieldvalues['PHY_COUNT_NO']+
           '盘点人员:'+fieldvalues['EMPLOYEE_NAME']
  else
   result:='';
 end;
end;

procedure TForm1.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) and (arow<sgrid1.rowcount-1) then
 begin
  if (ACol = 5 ) then
   begin
    ComboBox4.Left :=Rect.Left;
    ComboBox4.Top := Rect.Top+153;
    ComboBox4.Width :=Rect.Right - Rect.Left+1;
    ComboBox4.Height :=Rect.Bottom - Rect.Top;
    ComboBox4.Visible := True;
    if sgrid1.Cells[acol,arow]<>'' then
     combobox4.ItemIndex:=combobox4.Items.IndexOf(sgrid1.Cells[acol,arow])
    else
     combobox4.ItemIndex:=-1;
   end
else
    ComboBox4.Visible:=false;
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 countno:string;
begin
 countno:=self.findinvt_counting;

 if countno<>'' then
 begin
  messagedlg(countno,mtinformation,[mbcancel],0);
  application.Terminate;
 end;

 with dm.ADOQ do
 begin
  close;
  sql.Text:='select EMPLOYEE_NAME from data0005 where rkey='+user_ptr;
  open;
  employee_name:=fieldvalues['EMPLOYEE_NAME'];
  StatusBar1.Panels[1].Text:=employee_name;
 end;

  dm.ADO015.Open;
  key15.Caption:=dm.ADO015.fieldbyname('rkey').AsString;//给key15赋初值
  while not dm.ado015.Eof do
   begin
    combobox1.Items.Add(dm.ADO015.Fieldbyname('abbr_name').AsString);
    combobox2.Items.Add(dm.ADO015.Fieldbyname('abbr_name').AsString);
    dm.ADO015.next;
   end;
  combobox1.ItemIndex :=0;
  combobox2.ItemIndex :=-1;

 with dm.ADOQ do
 begin
  close;
  sql.Text:='SELECT GETDATE() AS sys_date';
  open;
  form1.sys_longdate:=fieldbyname('sys_date').AsString;
 end;
 StatusBar1.Panels[2].Text:='调拨日期:'+
 formatdatetime('yyyy-mm-dd HH:mm:ss',strtodatetime(form1.sys_longdate));
end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 if combobox2.ItemIndex=-1 then
  begin
   messagedlg('请选择转入工厂！',mtinformation,[mbok],0);
   combobox2.SetFocus;
   exit;
  end ;

   if combobox1.Enabled=true then
    with dm.ADOData22 do
     begin
     Close;
     Parameters[0].Value:=strtoint(key15.Caption);
     open;
    end;

  try
   Form_invser:=tForm_invser.Create(application);
   Form_invser.Edit1.Text:=edit1.Text;
   Form_invser.ShowModal;
   if sgrid1.RowCount>2 then
   begin
    combobox1.Enabled:=false;
    combobox2.Enabled:=false;
   end; 
  finally
 end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
if sgrid1.RowCount>2 then
 begin
 if messagedlg('你确定不保存此次调拨就退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  application.Terminate
 else
  sgrid1.SetFocus;
 end
else
 application.Terminate;
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
Sgrid1.Cells[5,sgrid1.Row]:=combobox4.Text;
dm.ADO016.MoveBy(combobox4.ItemIndex+1-dm.ADO016.RecNo);
sgrid2.Cells[3,sgrid1.Row]:=dm.ADO016.fieldbyname('rkey').AsString;
combobox4.visible:=false;
end;

procedure TForm1.N1Click(Sender: TObject);
 var
 i:word;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i]:=sgrid1.Rows[i+1];
   sgrid2.Rows[i]:=sgrid2.Rows[i+1];
  end;
 sgrid1.RowCount:=sgrid1.RowCount-1;
 sgrid2.RowCount:=sgrid2.RowCount-1;
 if sgrid1.RowCount<=2 then
  begin
   combobox1.Enabled:=true;
   combobox2.Enabled:=true;
   edit1.Clear;
   edit2.Clear;
   edit3.Clear;
   edit4.Clear;
   edit5.Clear;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form_invser.Free;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
   dm.ADO015.locate('abbr_name',combobox1.Text,[]);
   key15.Caption:=dm.ADO015.fieldbyname('rkey').Value;
end;

procedure TForm1.ComboBox2Exit(Sender: TObject);
begin
  if combobox2.ItemIndex>-1 then
  begin
   dm.ADO015.locate('abbr_name',combobox2.Text,[]);
    with dm.ADO016 do
     begin
      close;
      key15_1.Caption:=dm.ADO015.fieldbyname('rkey').Value;
      parameters.ParamByName('v_key').Value :=dm.ADO015.fieldbyname('rkey').Value;
      prepared;
      open;
     while not eof do
      begin
       combobox4.Items.Add(Fieldbyname('location').AsString);
       next;
      end;
   end;
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
i :integer;
begin
  if self.findinvt_counting<>'' then
  begin
    showmsg('操作不能继续原材料正在进行盘点!!!',1);
    exit;
  end;

  dm.ado04.Close;
  dm.ado04.Open;
  if find_soerror(trim(edit4.text)) then
  if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,[mbYes,mbNo],0)=mrYes  then
  begin
    edit4.Text:=dm.ado04SEED_VALUE.Value;
  end
  else
  begin
    edit4.SetFocus;
    exit;
   end;
 //======================data0456中增加一条入仓记录============================
  try
  dm.ADOConnection1.BeginTrans;

  with  dm.ADO456  do
  begin
    open ;
    append;
    dm.ADO456GRN_NUMBER.AsString:=edit4.Text;
    dm.ADO456warehouse_ptr.AsString:=key15_1.Caption;
    dm.ADO456SUPP_PTR.AsString:=self.key23.Caption;
    dm.ADO456currency_ptr.AsString:=self.key01.Caption;
    dm.ADO456CREATE_DATE.Value:=strtodatetime(sys_longdate);
    dm.ado456.fieldbyname('ship_DATE').value :=strtodatetime(sys_longdate);
    dm.ADO456CREATE_BY.asstring:=user_ptr;
    dm.ado456.fieldbyname('exch_rate').asstring:=edit5.text;
    dm.ADO456TTYPE.Value:=4;
    dm.ADO456STATUS.Value:=3;//已审核
    post;
  end;
  update_04(trim(edit4.Text));

  for i:=1 to sgrid1.RowCount-2 do
  begin
 //=================修改data0022表的纪录，使库存减少======================
    with dm.ADOe22 do
    begin
      close;
      parameters[0].Value:=strtoint(sgrid2.Cells[0,i]);
      open;
      if dm.ADOe22.FieldByName('quan_on_hand').Value<>strtofloat(sgrid2.Cells[2,i]) then
      begin
        dm.ADOConnection1.RollbackTrans;
        showmessage('库存数量状态发生变化,更新失败...');
        exit;
      end;
      edit;
      dm.ADOe22.FieldByName('quan_on_hand').Value:=dm.ADOe22.FieldByName('quan_on_hand').Value
                                                    -strtofloat(sgrid1.Cells[0,i]);
      post;
    end;

    with dm.ADOQ do
    begin
      close;
      sql.Clear;
      sql.Add('select * from data0022');
      sql.Add('where rkey='+sgrid2.Cells[0,i]);
      open;
    end;
   //=======================记录data0022增加的记录==============================
     with dm.ADOa22 do
     begin
       open;//打开
       append;
       dm.ADOa22INVENTORY_PTR.Value:=dm.ADOQ.fieldbyname('INVENTORY_PTR').value;
       dm.ADOa22GRN_PTR.Value:=dm.ADO456RKEY.Value;

       if dm.ADOQ.fieldbyname('SOURCE_PTR').asstring<>'' then //确定srce_ptr指针是否为空
         dm.ADOa22SOURCE_PTR.Value:=dm.ADOQ.fieldbyname('SOURCE_PTR').value;
       if trim(sgrid1.cells[5,i])<>''then
       begin
         dm.ADO016.Locate('location',sgrid1.Cells[5,i],[]); //确定data0016表中rkey的的位置
         dm.ADOa22LOCATION_PTR.Value := strtoint(sgrid2.Cells[3,i]);
           //dm.ADO016.fieldbyname('rkey').value;
       end;
       dm.ADOa22QUANTITY.value:=0;    //不对库存情况进行修改
       dm.ADOa22QUAN_ON_HAND.AsString:=sgrid1.Cells[0,i];
       dm.ADOa22PRICE.Value:=dm.ADOQ.fieldbyname('PRICE').value;
       dm.ADOa22TAX_2.Value:=dm.ADOQ.fieldbyname('TAX_2').value;
       dm.ADOa22TDATE.Value:=strtodatetime(self.sys_longdate);


       if  (dm.ADOQ.fieldbyname('EXPIRE_DATE').value=null) then
       begin
       dm.ADOa22EXPIRE_DATE.Value:=Now;
       end
       else
       dm.ADOa22EXPIRE_DATE.Value:=dm.ADOQ.fieldbyname('EXPIRE_DATE').value;
       if dm.ADOQ.fieldbyname('rohs').value<>'' then //确定rohs指针是否为空
         dm.ADOa22rohs.Value:=dm.ADOQ.fieldbyname('rohs').AsString;
       if dm.ADOQ.fieldbyname('supplier2').value<>'' then
         dm.adoa22.Fieldbyname('supplier2').value:=dm.ADOQ.fieldbyname('supplier2').value ;
       dm.adoa22.fieldbyname('status').value :=dm.adoQ.fieldbyname('status').value;
       if dm.ADOQ.fieldbyname('location_ptr_from').value>0 then
         dm.adoa22.fieldbyname('location_ptr_from').value:=dm.adoq.fieldbyname('location_ptr_from').value;
       dm.adoa22.fieldbyname('ttype').value:=dm.adoq.fieldbyname('ttype').value;
      //dm.adoa22.fieldbyname('whouse_ptr').value:=key15_1.Caption;
       dm.adoa22.fieldbyname('supplier_ptr').value:=dm.adoq.fieldbyname('supplier_ptr').value;
      //dm.adoa22.fieldbyname('currency_ptr').value:=dm.adoq.fieldbyname('currency_ptr').value;
      //if  dm.adoq.fieldbyname('exchange_rate').asstring<>'' then
      //dm.adoa22.fieldbyname('exchange_rate').value:=dm.adoq.fieldbyname('exchange_rate').value;
       if  dm.adoq.fieldbyname('tax_price').value>=0 then
         dm.adoa22.fieldbyname('tax_price').value:=dm.adoq.fieldbyname('tax_price').value;
       post;
     end;

   //==================在data0095中记录data0022减少的记录==========================
     with dm.ADO027 do
     begin
       open ;
       append;
       dm.ado027.fieldbyname('D0022_toptr').value:=dm.ADOa22.fieldbyname('RKEY').Value;
       dm.ado027.fieldbyname('D0022_FROMPTR').value:=strtoint(sgrid2.Cells[0,i]);
       dm.ado027.fieldbyname('QUANTITY').asstring:=sgrid1.Cells[0,i];
       dm.ado027.fieldbyname('TDATE').value:=strtodatetime(self.sys_longdate);
       dm.ado027.fieldbyname('EMPL_PTR').asstring:=user_ptr;
     { dm.ADO095TRAN_TP.Value:=1;
      dm.ADO095INVT_PTR.Value:=flag;
      dm.ADO095SRCE_PTR.value:=dm.ADOa22.fieldbyname('RKEY').Value;
      dm.ADO095TRAN_BY.asstring:=user_ptr.Caption;
      dm.ADO095QUANTITY.AsString:=sgrid1.Cells[0,i];
      dm.ADO095TRAN_DATE.Value:=strtodatetime(self.sys_longdate);
      dm.ado095.fieldbyname('invt_ptr').value:=strtoint(sgrid2.Cells[0,i]); }
       post;
     end;
   end;//对应for语句中的begin
  dm.ADOConnection1.CommitTrans;
  update_main();
  showmsg('操作成功!',1) ;
  except
    on e: exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(e.Message,mtinformation,[mbcancel],0);
    end;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true;
end;

procedure TForm1.BitBtn1Enter(Sender: TObject);
var
i :byte;
begin
 if sgrid1.RowCount<=2 then
 begin
  messagedlg('没有发放的物料不能保存!!',mtinformation,[mbcancel],0);
  bitbtn2.SetFocus;
  exit;
 end;
for i:=1 to sgrid1.RowCount-2 do
if trim(sgrid1.cells[5,i])='' then
 begin
 showmessage('第'+inttostr(i)+'条记录您还没有选择转入仓库！');
 sgrid1.setfocus;
 exit;
 end;

end;

procedure TForm1.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  sgrid1.MouseToCell(x,y,column,row);
  if row<>0 then sgrid1.Row:=row;
 end;
if button=mbleft then
 begin
 sgrid1.mousetocell(x,y,column,row);
 if row=sgrid1.rowcount-1 then combobox4.visible:=false;
 end;
end;


end.
