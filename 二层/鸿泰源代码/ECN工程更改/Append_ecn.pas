unit Append_ecn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ImgList,raFunc,math;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup2: TRadioGroup;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    Edit6: TEdit;
    Label5: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label9: TLabel;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    Label10: TLabel;
    Label11: TLabel;
    rkey10: TLabel;
    rkey25: TLabel;
    rkey08: TLabel;
    ImageList1: TImageList;
    CheckBox1: TCheckBox;
    sales_flag: TLabel;
    rkey15: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TreeView2Change(Sender: TObject; Node: TTreeNode);
    procedure Button1Click(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
  private
    { Private declarations }
   qa_status:boolean;
   EST_SCRAP,EST_SCRAP1:Single;
   procedure get_treedate(rkey25: integer;treeview:Ttreeview);
   procedure update_targetpart(ttype:byte);
   function find_partnumber(part_number:string):boolean;
   function find_ecn_qa(): boolean;
   function ecn_number_error(number: string): boolean;
   function findpart_emptyerror():boolean;
   procedure update_04(v_seed: string);
   procedure update_08();
   procedure UPDATEDATA0025(Ecnstart:byte;RKEY:integer);
   function getparent_ptr(node:TTreeNode):integer;
   procedure append_log119(rkey:integer);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses prod_search, product_search, DAMO, main,common, ADODB, DB;

{$R *.dfm}

function TForm2.getparent_ptr(node: TTreeNode): integer;
var parent_code:TTreeNode;
begin
 parent_code:=node.Parent;
 result:=Pinteger(parent_code.data)^;
end;

procedure TForm2.update_04(v_seed: string);
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
    dm.ads04.Edit; //使前缀不变后缀加1
    dm.ads04SEED_VALUE.Value := new_seed;
    dm.ads04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ads04.Edit;
     dm.ads04SEED_VALUE.Value := new_seed;
     dm.ads04.Post;
    end;
end;

procedure TForm2.append_log119(rkey: integer);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='SELECT CUST_PART_PTR, ENT_DATE from data0119'+#13+
            'where CUST_PART_PTR is null';
  open;
  append;
  fieldvalues['cust_part_ptr']:=rkey;
  fieldvalues['ENT_DATE']:= getsystem_date(dm.adoquery2,0);
  post;
 end;
end;

procedure TForm2.update_08();
var
 i,v_length:integer;
 v_last,new_seed,v_seed:string;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select data0081.sufchar from data0081'+#13+
             'inner join data0008 on data0081.rkey=data0008.layer_pre'+#13+
             'where data0008.rkey='+rkey08.Caption;
   open;
   v_seed := trim(fieldbyname('sufchar').AsString);
   v_length := length(v_seed);
  end;

 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ADOQuery1.Edit;                   //使前缀不变后缀加1
    dm.ADOQuery1.FieldValues['sufchar']:= new_seed;
    dm.ADOQuery1.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ADOQuery1.Edit;                   //使前缀不变后缀加1
     dm.ADOQuery1.FieldValues['sufchar']:= new_seed;
     dm.ADOQuery1.Post;
    end;
end;

PROCEDURE TForm2.UPDATEDATA0025(Ecnstart:byte;RKEY:integer);
BEGIN
if Ecnstart=1 then        //下批生效
begin
  with dm.ADOQuery2 do     //更新顶层
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set DATA0025.ONHOLD_SALES_FLAG=1'+#13+
             'FROM dbo.Data0025'+#13+
    'where Data0025.RKEY='+inttostr(rkey);
    ExecSQL;
   end;

  with dm.ADOQuery2 do        //更新第二层
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set DATA0025.ONHOLD_SALES_FLAG=1'+#13+
             'FROM Data0025 INNER JOIN'+#13+
    'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
    'where Data0025_1.RKEY='+inttostr(rkey);
    ExecSQL;
   end;

  with dm.ADOQuery2 do      //更新第三层
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set DATA0025.ONHOLD_SALES_FLAG=1'+#13+
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
     'where Data0025_2.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;


  with dm.ADOQuery2 do      //更新第四层
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set DATA0025.ONHOLD_SALES_FLAG=1'+#13+
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_3 ON '+#13+
      'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
     'where Data0025_3.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;

end
else begin            //立即生效
  with dm.ADOQuery2 do     //更新顶层
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+
             'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+
             'data0025.ONHOLD_PLANNING_FLAG=1'+#13+
             'FROM dbo.Data0025'+#13+
    'where Data0025.RKEY='+inttostr(rkey);
    ExecSQL;
   end;

  with dm.ADOQuery2 do        //更新第二层
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+
             'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+
             'data0025.ONHOLD_PLANNING_FLAG=1'+#13+
             'FROM Data0025 INNER JOIN'+#13+
    'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
    'where Data0025_1.RKEY='+inttostr(rkey);
    ExecSQL;
   end;

  with dm.ADOQuery2 do      //更新第三层
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+  //暂缓下单
             'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+   //暂缓发放工单
             'data0025.ONHOLD_PLANNING_FLAG=1'+#13+  //暂缓投产
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
     'where Data0025_2.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;

  with dm.ADOQuery2 do      //更新第四层
   begin
    close;
    sql.Text:='update data0025'+#13+
             'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+  //暂缓下单
             'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+   //暂缓发放工单
             'data0025.ONHOLD_PLANNING_FLAG=1'+#13+  //暂缓投产
      'FROM data0025 INNER JOIN  '+#13+
      'Data0025 Data0025_1 ON'+#13+
      'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_2 ON '+#13+
      'Data0025_1.PARENT_PTR = Data0025_2.RKEY INNER JOIN'+#13+
      'Data0025 Data0025_3 ON '+#13+
      'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
     'where Data0025_3.RKEY = '+inttostr(rkey);
    ExecSQL;
   end;

 end;
END;

function TForm2.findpart_emptyerror: boolean;
var i:byte;
begin
 result:=false;
 for i:=1 to treeview2.Items.Count-1 do
  if trim(treeview2.Items[i].Text)='' then
  begin
   result:=true;
   break;
  end;
end;

function TForm2.find_ecn_qa(): boolean;
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select PPC_CONTROL1 from data0192');
  open;
  result:=FieldByName('PPC_CONTROL1').AsInteger=1;
 end;
end;


function TForm2.ecn_number_error(number: string): boolean;
begin
 result:=false;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0273');
  sql.Add('where ECN_NO='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

function TForm2.find_partnumber(part_number: string): boolean;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:=
  'SELECT data0025.rkey,Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,'+#13+
    'Data0008.PRODUCT_NAME, data0008.prod_code,Data0010.CUST_CODE,'+#13+
    'Data0025.ttype,Data0025.PROD_CODE_PTR,Data0025.CUSTOMER_PTR,'+#13+
    'Data0025.ONHOLD_SALES_FLAG,data0025.PROD_ROUTE_PTR,data0025.quality_status,'+#13+
    'data0008.EST_SCRAP,data0008.EST_SCRAP1'+#13+
  'FROM Data0008 INNER JOIN'+#13+
        'Data0025 ON'+#13+
        'Data0008.RKEY = Data0025.PROD_CODE_PTR INNER JOIN'+#13+
        'Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY'+#13+
  'where data0025.parent_ptr is null'+#13+
  'and Data0025.MANU_PART_NUMBER ='''+part_number+'''';
 open;
 if isempty then
  result:=false
 else result:=true;
end;
end;

procedure TForm2.get_treedate(rkey25: integer;treeview:Ttreeview);
var node:ttreenode;   //treeview控件的节点变量
    rkey0025:^integer;
     LNodeArr:array of TTreeNode;
     i,j:Integer;
begin

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:=' ;with CTE(rkey,PARENT_PTR,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,ttype,QTY_PARENTBOM,OPT_LOT_SIZE,lv) as    ' + #13+
              '(    ' + #13+
              '  select rkey,PARENT_PTR,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,ttype,QTY_PARENTBOM,OPT_LOT_SIZE,0  '+ #13+
              '  from data0025 where rkey='+inttostr(rkey25) + #13+
              '  UNION ALL  '+ #13+
              '  select d25.rkey,d25.PARENT_PTR,d25.MANU_PART_NUMBER,d25.qty_bom,d25.shelf_life,d25.analysis_code_3,d25.ttype,d25.QTY_PARENTBOM,d25.OPT_LOT_SIZE,cte.lv+1 ' + #13+
              '  from data0025 d25 INNER JOIN CTE on	d25.parent_ptr=CTE.rkey ' + #13+
              ')  ' + #13+
              ' select * from CTE order by lv ';
//    ShowMessage(SQL.Text);
       open;
    if not IsEmpty then
    begin
      j:=0;
      while not Eof do
      begin
        new(rkey0025);
        rkey0025^ := fieldvalues['rkey'];
        if fieldbyname('PARENT_PTR').AsInteger = 0 then
          node := treeview.Items.AddObject
          (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025) //增加顶层节点
        else
        begin
          for i:=0 to Length(LNodeArr)-1 do
          begin
            if Integer(LNodeArr[i].data^) = fieldbyname('PARENT_PTR').AsInteger  then
            begin
              node := treeview.Items.AddChildObject
              (LNodeArr[i],fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
              Break;
            end;
          end;
        end;
        SetLength(LNodeArr,Length(LNodeArr) + 1);
        LNodeArr[j]:= node;
        j:=j + 1;
        node.ImageIndex:= fieldbyname('lv').AsInteger;  //为节点定义图画
        Next;
      end;
    end;
  end;

//with dm.ADOQuery1 do
// begin
//  close;
//  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
//              inttostr(rkey25);
//  open;
//  new(rkey0025);
//  rkey0025^:=fieldvalues['rkey'];
//  node:=treeview.Items.AddObject
//  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
//  node.ImageIndex:=0;  //为第一层节点定义图画
// end;
//
//with dm.ADOQuery1 do
// begin
//  close;
//  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
//              inttostr(rkey25);
//  open;
//  while not dm.ADOQuery1.Eof do
//  begin
//   new(rkey0025);
//   rkey0025^:= dm.ADOQuery1.fieldvalues['rkey'];
//   node:=treeview.Items.AddChildObject
//      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//   node.ImageIndex := 1;
//   with dm.ADOQuery2 do
//    begin
//     close;
//     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
//              dm.ADOQuery1.fieldbyname('rkey').AsString;
//     open;
//     while not dm.ADOQuery2.Eof do
//     begin
//      new(rkey0025);
//      rkey0025^:= dm.ADOQuery2.fieldvalues['rkey'];
//      node:=treeview.Items.AddChildObject
//       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//      node.ImageIndex := 2;
//       with dm.ADOQuery3 do
//        begin
//         close;
//         sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
//                  dm.ADOQuery2.fieldbyname('rkey').AsString;
//         open;
//         while not dm.ADOQuery3.Eof do
//         begin
//          new(rkey0025);
//          rkey0025^:= dm.ADOQuery3.fieldvalues['rkey'];
//          node:=treeview.Items.AddChildObject
//           (node, dm.ADOQuery3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//          node.ImageIndex := 3;
//          node:=node.Parent;
//          dm.ADOQuery3.Next;
//         end;
//        end;
//      node:=node.Parent;
//      dm.ADOQuery2.Next;
//     end;
//    end;
//   node:=node.Parent; //节点指向其父节点值
//   dm.ADOQuery1.Next;
//  end;
// end;
 treeview.FullExpand; //全部展开
end;

procedure TForm2.update_targetpart(ttype:byte);
begin
 edit6.Text:=edit4.Text;
 treeview1.Items.Clear;
 Self.get_treedate(strtoint(rkey25.caption),treeview1);
 treeview2.Items.Assign(treeview1.Items);
 treeview2.FullExpand;
 groupbox1.Enabled:=true;
 checkbox1.Enabled:=true;
 edit5.Enabled:=true;
 edit6.Enabled:=true;
 if ttype=0 then    //量产
 begin
  radiobutton1.Enabled:=true;
  radiobutton2.Enabled:=true;
  radiobutton3.Enabled:=false;
  radiobutton4.Enabled:=false;
  radiobutton1.Checked:=false;
  radiobutton1.Checked:=true;
 end
 else             //样板
   begin
    radiobutton1.Enabled:=false;
    radiobutton2.Enabled:=false;
    radiobutton3.Enabled:=true;
    radiobutton4.Enabled:=true;
    radiobutton3.Checked:=false;
    radiobutton3.Checked:=true;
   end;
end;


procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 form_product:=tform_product.Create(application);
 form_product.adoquery1.Close;
 form_product.adoquery1.Parameters.ParamValues['part_number']:=
  trim(edit3.Text)+'%';
 form_product.adoquery1.open;
 if form_product.ShowModal=mrok then
  begin
   edit2.Text:=form_product.adoquery1CUST_CODE.Value;
   edit3.Text:=form_product.adoquery1MANU_PART_NUMBER.Value;
   edit3.Font.Color:=clwindowtext;
   qa_status:=Form_product.adoquery1quality_status.Value;
   edit4.Text:=form_product.adoquery1MANU_PART_DESC.Value;
   edit7.Text:=form_product.adoquery1prod_code.Value;
   label9.Caption:=form_product.adoquery1PRODUCT_NAME.Value;
   rkey10.Caption:=form_product.adoquery1CUSTOMER_PTR.AsString;
   rkey25.Caption:=form_product.adoquery1rkey.AsString;
   rkey08.Caption:=form_product.adoquery1PROD_CODE_PTR.AsString;
   rkey15.Caption:=inttostr(form_product.adoquery1PROD_ROUTE_PTR.Value);
   sales_flag.Caption:= form_product.adoquery1ONHOLD_SALES_FLAG.AsString;
   self.update_targetpart(form_product.adoquery1ttype.Value);
   EST_SCRAP:=Form_product.adoquery1EST_SCRAP.Value;
   EST_SCRAP1:=Form_product.adoquery1EST_SCRAP1.Value;
   edit5.SetFocus;
  end
 else edit3.SetFocus; 
 form_product.Free;
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 node.SelectedIndex:=4;
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
 begin
  edit3.SelectAll;
  edit3.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
 if (trim(edit3.Text)<>'') and (activecontrol.Name<>'BitBtn1') then
 begin
  if self.find_partnumber(trim(edit3.Text)) then
  begin
   if strtoint(rkey25.Caption)<> dm.adoquery1.fieldbyname('rkey').Value then
   begin
   edit2.Text:=dm.adoquery1.fieldbyname('CUST_CODE').Value;
   edit3.Text:=dm.adoquery1.fieldbyname('MANU_PART_NUMBER').Value;
   edit4.Text:=dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString;
   qa_status:=dm.ADOQuery1.FieldByName('quality_status').Value;
   edit7.Text:=dm.adoquery1.fieldbyname('prod_code').Value;
   label9.Caption:=dm.adoquery1.fieldbyname('PRODUCT_NAME').AsString;
   rkey10.Caption:=dm.adoquery1.fieldbyname('CUSTOMER_PTR').AsString;
   rkey25.Caption:=dm.adoquery1.fieldbyname('rkey').AsString;
   rkey08.Caption:=dm.adoquery1.fieldbyname('PROD_CODE_PTR').AsString;
   rkey15.Caption:=inttostr(dm.adoquery1.fieldbyname('PROD_ROUTE_PTR').Value);
   sales_flag.Caption:=dm.adoquery1.fieldbyname('ONHOLD_SALES_FLAG').AsString;
   EST_SCRAP:=DM.adoquery1.fieldbyname('EST_SCRAP').Value;
   EST_SCRAP1:=DM.adoquery1.fieldbyname('EST_SCRAP1').Value;
   self.update_targetpart(dm.ADOQuery1.FieldValues['ttype']);
   end;
   edit3.Font.Color:=clwindowtext;
  end
  else begin
   messagedlg('本厂编号加版本输入错误!',mtinformation,[mbcancel],0);
   edit3.SetFocus;
  end;
 end
else
if (trim(edit3.Text)='') and (activecontrol.Name<>'BitBtn1') then
 begin
  CHECKBOX1.Checked:=false;
  checkbox1.Enabled:=false;
  groupbox1.Enabled:=false;
  edit5.Enabled:=false;
  edit6.Enabled:=false;
  treeview1.Items.Clear;
  treeview2.Items.Clear;
  edit2.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  edit7.Text:='';
  label9.Caption:='';
  rkey10.Caption:='0';
  rkey25.Caption:='0';
  rkey08.Caption:='0';
 end;
end;

procedure TForm2.Edit5Change(Sender: TObject);
var
 i:integer;
begin
if treeview2.Items.Count>0 then
 treeview2.Items[0].Text:=edit5.Text;
for i:=0 to treeview2.Items.Count-1 do
 if i=0 then
  treeview2.Items[i].Text:=edit5.Text
 else
  treeview2.Items[i].Text:= edit5.Text+'.'+
    copy(treeview2.Items[i].Text,
     pos('.',treeview2.Items[i].Text)+1,
     length(treeview2.Items[i].Text)-
     pos('.',treeview2.Items[i].Text));
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
try
 application.CreateForm(tform_prodcode,form_prodcode);
 if form_prodcode.ShowModal=mrok then
 begin
  edit7.Text:=form_prodcode.adoquery1prod_code.Value;
  label9.Caption:=form_prodcode.adoquery1product_name.Value;
  rkey08.caption:=form_prodcode.adoquery1rkey.AsString;
  EST_SCRAP:=form_prodcode.adoquery1EST_SCRAP.Value;
  EST_SCRAP1:=form_prodcode.adoquery1EST_SCRAP1.Value;
 end
 else edit4.SetFocus;
finally
 form_prodcode.Free;
end;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
var
  CUSTSTASHIP,CUSTSTATOOL,ANALYSIS_CODE3:string;
begin
 if checkbox1.Checked then  //全新编号
 begin

  with dm.ADOQuery2 do
  begin
    Close;
    SQL.Text:='select CUSTSTASHIP,CUSTSTATOOL from data0192';
    open;
    CUSTSTASHIP:=fieldbyname('CUSTSTASHIP').AsString;    //流水号是否在前Y/N
    CUSTSTATOOL:=fieldbyname('CUSTSTATOOL').AsString;   //厂编中包含客户识别码y/N
  end;

  with dm.ADOQuery2 do
  begin
   close;
   sql.Text:='select part_batch,part_templet from data0015 where rkey='+rkey15.Caption;
   open;
  end;    //全新编号时提取工厂前缀，andy 2008-11-25

  with dm.ADOQuery1 do          //客户识别码
  begin
    Close;
    sql.Text:='select ANALYSIS_CODE3 from data0010 where rkey='+rkey10.Caption;
    open;
    if (not IsEmpty) and (CUSTSTATOOL='Y') then
     ANALYSIS_CODE3 :=fieldbyname('ANALYSIS_CODE3').AsString
    else
     ANALYSIS_CODE3 :='';
  end;

  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select data0008.PRECHAR1,data0008.PRECHAR2,'+#13+
    'data0081.sufchar from data0081'+#13+
    'inner join data0008 on data0081.rkey=data0008.layer_pre'+#13+
    'where data0008.rkey='+rkey08.Caption;
   open;
   if CUSTSTASHIP='Y' then           //流水号在前
     if (radiobutton1.Checked) or (radiobutton4.Checked) then
      edit5.Text:=fieldbyname('sufchar').AsString+
                  dm.adoquery2.fieldbyname('part_batch').AsString+
                  ANALYSIS_CODE3 +
                  fieldbyname('PRECHAR1').AsString+'A0' //量产初始值
     else
      edit5.Text:=fieldbyname('sufchar').AsString+
                  dm.adoquery2.fieldbyname('part_templet').AsString+
                  ANALYSIS_CODE3 +
                  fieldbyname('PRECHAR2').AsString+'A0' //样板初始值
   else                               //流水号在后
   if (radiobutton1.Checked) or (radiobutton4.Checked) then
    edit5.Text:=dm.adoquery2.fieldbyname('part_batch').AsString+ANALYSIS_CODE3+
      fieldbyname('PRECHAR1').AsString+fieldbyname('sufchar').AsString+'A0' //量产初始值
   else
    edit5.Text:=dm.adoquery2.fieldbyname('part_templet').AsString+ANALYSIS_CODE3+
      fieldbyname('PRECHAR2').AsString+fieldbyname('sufchar').AsString+'A0'; //样板初始值

  end;
 end
 else
 begin  //直接升级，不全新编号
  if radiobutton1.Enabled then
  begin
   radiobutton1.Checked:=false;
   radiobutton1.Checked:=true;
  end
  else
  begin
   radiobutton3.Checked:=false;
   radiobutton3.Checked:=true;
  end;
 end;
end;

procedure TForm2.TreeView2Change(Sender: TObject; Node: TTreeNode);
begin
 node.SelectedIndex:=4;
 if node.Level=0 then
  treeview2.ReadOnly:=true
 else
  treeview2.ReadOnly:=false; 
end;

procedure TForm2.Button1Click(Sender: TObject);
var i,j:word;
    parent,toprkey25:integer;
    sRev:string;
begin
 if ((uppercase(copy(trim(edit5.Text),1,1))<>uppercase(copy(trim(edit3.Text),1,1))) and (radiobutton1.Checked or radiobutton3.Checked)) or
   ((uppercase(copy(trim(edit5.Text),1,1))=uppercase(copy(trim(edit3.Text),1,1))) and (radiobutton2.Checked or radiobutton4.Checked)) then
 begin
  showmessage('变更类型与产品编号规则相冲突，必须重新编号！');
  exit;
 end;

 if (radiobutton4.Checked) and (find_ecn_qa()) and (not qa_status) then
 begin
  showmessage('样转量产检查出样品没有输入完成品质跟踪表!');
  exit;
 end;

 if self.ecn_number_error(trim(edit1.Text)) then
 begin
  dm.ADS04.Close;
  dm.ADS04.Open;
  if dm.ADS04SEED_FLAG.Value<>1 then
  begin
   if messagedlg('ECN编号重复可能多人同时新增,是否自动更新编号为:'+
    dm.adS04SEED_VALUE.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
    edit1.Text:=dm.ADs04SEED_VALUE.Value
   else begin
    edit1.SetFocus;
    exit;
   end;
  end
  else begin
   messagedlg('ECN编号重复!请手工重新输入',mterror,[mbok],0);
   edit1.SetFocus;
   exit;
  end;
 end;  //以上判断ECN编号是否重复

 if find_partnumber(trim(edit5.Text)) then
 begin
  messagedlg('变更后本厂编号重复!可能需要从产品类型中全新编号!',mterror,[mbok],0);
  edit5.SetFocus;
  exit;
 end;  //以上判断变更后厂编版本是否重复

 sRev:=copy(edit5.Text,length(edit5.Text)-1,2);
 if not ((upcase(sRev[1]) in ['A'..'Z']) and (sRev[2] in ['0'..'9'])) then
 begin
  messagedlg('版本号不合法!',mterror,[mbok],0);
  edit5.SetFocus;
  exit;
 end;

 dm.ADOConnection1.BeginTrans;    //开始变更，复制数据
 screen.Cursor:=crappstart;
 toprkey25:=0;
 try
  for i:=0 to treeview1.Items.Count-1 do
  begin
   parent:=Pinteger(treeview1.Items[i].Data)^;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select * from data0025 where rkey='+ inttostr(parent);
    open;
   end;

   dm.AQY0025.Close;
   dm.AQY0025.Parameters[0].Value:=null;
   dm.AQY0025.Open;
   dm.AQY0025.append;
   for j:=4 to dm.AQY0025.FieldCount-1 do
   dm.AQY0025.Fields[j].Value:=dm.ADOQuery1.FieldValues[dm.AQY0025.Fields[j].FieldName];
   dm.AQY0025CREATED_BY_EMPL_PTR.Value:= strtoint(user_ptr);
   dm.AQY0025CUSTPART_ENT_DATE.Value:= getsystem_date(dm.adoquery2,0);
   dm.AQY0025LAST_MODIFIED_DATE.Value:= getsystem_date(dm.adoquery2,0);
   dm.AQY0025LAST_MODIFIED_BY_PTR.Value:= strtoint(user_ptr);
   dm.AQY0025TSTATUS.Value:=6;     //未提交

   dm.AQY0025CHECK_BY_PTR.AsVariant:=null;
   dm.AQY0025CHECK_DATE.AsVariant:=null;
   dm.AQY0025AUDITED_BY_PTR.AsVariant:=null;
   dm.AQY0025AUDITED_DATE.AsVariant:=null;
   dm.AQY0025ALLOW_EDIT_FLAG.Value:='Y';       //允许编辑
   dm.AQY0025ONHOLD_SALES_FLAG.Value:=0;       //可以销售
   dm.AQY0025ONHOLD_RELEASE_FLAG.Value:=1;     //工单发出暂缓
   dm.AQY0025ONHOLD_PLANNING_FLAG.Value:=1;    //投产暂缓
   dm.AQY0025MANU_PART_NUMBER.Value:=treeview2.Items[i].Text;
   dm.AQY0025MANU_PART_DESC.Value:=edit6.Text;
   if (radiobutton1.Checked) or (radiobutton4.Checked) then
    dm.AQY0025ttype.Value:=0    //量产
   else
    dm.AQY0025ttype.Value:=1;   //样版
   if i > 0 then      //内层
    dm.AQY0025PARENT_PTR.Value:=self.getparent_ptr(treeview2.Items[i])
   else                   //顶层
   begin
    dm.AQY0025PARENT_PTR.AsVariant:=null;
    dm.AQY0025PROD_CODE_PTR.Value:=strtoint(rkey08.Caption);
    dm.AQY0025ANCESTOR_PTR.Value:=1;            //ecn升级新增
    if  dm.AQY0025ttype.Value=0 then              //重新更新报废率
     dm.AQY0025EST_SCRAP.Value:=self.EST_SCRAP
    else
     dm.AQY0025EST_SCRAP.Value:=self.EST_SCRAP1;
   end;

   dm.AQY0025.Post;  //以上复制厂编基本信息25表

   if i=0 then  toprkey25:=dm.AQY0025RKEY.Value;
   Pinteger(treeview2.Items[i].Data)^:=dm.AQY0025RKEY.Value;

   with dm.ADOQuery1 do       //拼版结构
   begin
    close;
    sql.Text:='select * from data0502 where source_ptr='+ inttostr(parent);
    open;
   end;
   if not dm.ADOQuery1.IsEmpty then
   begin
    dm.ads502.Close;
    dm.ads502.Parameters[0].Value:=null;
    dm.ads502.Open;
    dm.ads502.Append;
    for j:=1 to 20 do
     dm.ads502.Fields[j].Value:=dm.ADOQuery1.FieldValues[dm.ads502.Fields[j].FieldName];
    dm.ads502source_ptr.Value:= dm.AQY0025RKEY.Value;
    dm.ads502.Post;
   end;
   //----//以下复制bom参数和工序流程
   with dm.ADOQuery2 do      //打开BOM制程参数
   begin
    close;
    sql.Text:=
     'SELECT Data0497.PARAMETER_PTR, Data0497.PARAMETER_VALUE,'+#13+
     'Data0497.SOURCE_PTR, Data0497.ROUTE_STEP_PTR,Data0497.SEQ_NO'+#13+
     'FROM dbo.Data0038 INNER JOIN'+#13+
     'dbo.Data0497 ON dbo.Data0038.RKEY = dbo.Data0497.ROUTE_STEP_PTR'+#13+
     'where data0038.source_ptr='+inttostr(parent)+#13+
     'order by Data0497.ROUTE_STEP_PTR';
    open;
   end;

   with dm.ADOQuery1 do       //打开工艺流程
   begin
    close;
    sql.Text:='SELECT rkey,SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER,'+#13+
              'tooling_rev,OUTP_SPFC,tool_old_rev FROM Data0038'+#13+
      'where source_ptr='+inttostr(parent)+#13+
      'order by step_number';
    open;
    if not isempty then
    begin
     dm.ADS38.Close;
     dm.ADS38.Parameters[0].Value:=null;
     dm.ADS38.Open;
     if not dm.ADOQuery2.IsEmpty then dm.ads497.Open;

     while not eof do
     begin
      dm.ADS38.Append;
      for j:=2 to 7 do
       dm.ADS38.Fields[j].Value := FieldValues[dm.ADS38.Fields[j].FieldName];
      dm.ADS38SOURCE_PTR.Value := dm.AQY0025RKEY.Value;
      dm.ADS38tool_old_rev.Value:=dm.ADS38tooling_rev.Value;
      if trim(dm.ADS38tooling_rev.Value)<>'' then
        dm.ADS38tooling_rev.Value:=sRev;
      dm.ADS38.post;

      dm.ADOQuery2.Filter:='ROUTE_STEP_PTR='+fieldbyname('rkey').AsString;
      while not dm.ADOQuery2.Eof do
      begin
       dm.ads497.Append;
       for j:=0 to 4 do
        dm.ads497.Fields[j].Value :=dm.ADOQuery2.FieldValues[dm.ads497.Fields[j].FieldName];
       dm.ads497ROUTE_STEP_PTR.Value:=dm.ads38rkey.value;
       dm.ads497.Post;
       dm.ADOQuery2.Next;
      end;
      next;
     end;
     dm.ADOQuery2.Filter:='';
    end;
   end;    //----//以上复制bom参数和工序流程

   if (radiobutton4.Checked) and (find_ecn_qa()) then
   with dm.ADOQuery1 do  //样板转批量将样品品质跟踪表复制到工序制程参数
    begin
      Close;
      SQL.Text := 'update data0038'+#13+
       'set DEF_ROUT_INST=isnull(DEF_ROUT_INST,'''')+isnull(DATA0031.technology_diff,'''')'+#13+
       'FROM   dbo.DATA0031 INNER JOIN  '+#13+
       'dbo.Data0038 ON dbo.DATA0031.STEP_NUMBER = dbo.Data0038.STEP_NUMBER'+#13+
       'AND dbo.DATA0031.DEPT_PTR = dbo.Data0038.DEPT_PTR'+#13+
       'WHERE     (dbo.DATA0031.SOURCE_PTR = '+inttostr(parent)+') AND'+#13+
       '(dbo.Data0038.SOURCE_PTR = '+dm.AQY0025RKEY.AsString+')';
      ExecSQL;
    end;             

   with dm.ADOQuery1 do //制程参数
   begin
    close;
    sql.Text:='SELECT Data0494.PARAMETER_PTR, Data0494.PARAMETER_VALUE,'+#13+
     'Data0494.custpart_ptr,Data0494.step_number,Data0494.seq_no,Data0494.Doc_Flag,'+#13+
     'Data0494.after_flag,Data0494.flow_spfc_flag,data0494.outp_spfc_flag,data0278.status4'+#13+
     'FROM Data0494 inner join data0278'+#13+
     'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
     'where Data0494.custpart_ptr = '+inttostr(parent)+#13+
     'order by Data0494.step_number,Data0494.seq_no';
    open;
    if not isempty then
    begin
     dm.ads494.Close;
     dm.ads494.Parameters[0].Value:=null;
     dm.ads494.Open;
     while not eof do
     begin
      dm.ads494.Append;
      for j:=0 to 8 do
       dm.ads494.Fields[j].Value:=FieldValues[dm.ads494.Fields[j].FieldName];
      dm.ads494custpart_ptr.Value:= dm.AQY0025RKEY.Value;
      if fieldbyname('status4').AsInteger=1 then
       dm.ads494PARAMETER_VALUE.Value:='';
      dm.ads494.post;
      next;
     end;
    end;
   end;

   with dm.ADOQuery1 do         //全局参数加流程判断参数
   begin
    close;
    sql.Text:='select data0279.PARAMETER_PTR, data0279.PARAMETER_VALUE ,'+#13+
     'data0279.IES_PROD,data0279.IES_CRP,data0278.status4'+#13+
     'from data0279 inner join data0278'+#13+
     'on data0279.PARAMETER_PTR=data0278.rkey'+#13+
     'where data0279.source_ptr='+inttostr(parent)+#13+
     'order by data0279.IES_CRP';
    open;
    if not isempty then
    begin
     dm.ads279.close;
     dm.ads279.Parameters[0].Value:=null;
     dm.ads279.Open;
     while not eof do
     begin
      dm.ads279.Append;
      for j:=1 to 4 do
       dm.ads279.Fields[j].Value:=FieldValues[dm.ads279.Fields[j].FieldName];
      dm.ads279source_PTR.Value:= dm.AQY0025RKEY.Value;
      if fieldbyname('status4').AsInteger=1 then
       dm.ads279PARAMETER_VALUE.Value:='';
      dm.ads279.post;
      next;
     end;
    end;
   end;

   with dm.ADOQuery1 do   //29 钻咀表
   begin
    close;
    sql.Text:='INSERT INTO DATA0029 '+
     '(SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
     'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER) '+#13+
     'SELECT '+dm.AQY0025RKEY.AsString+' as SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, '+#13+
     'PTH, TOLERANCE, DRILL_DIA,UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
     'FROM dbo.Data0029'+#13+
     'where source_ptr='+inttostr(parent);
    ExecSQL;
   end;

   if i=0 then             //顶层产品:复制评审,ENC,阻抗,
   begin
     with dm.ADOQuery1 do      //89评审参数
     begin
      close;
      sql.Text:='INSERT INTO DATA0089 '+
       '(cust_part_ptr,parameter_ptr,tvalue)'+#13+
       'SELECT '+dm.AQY0025RKEY.AsString+' as cust_part_ptr,parameter_ptr,tvalue'+#13+
       'FROM dbo.Data0089'+#13+
       'where cust_part_ptr='+inttostr(parent) +
       ' order by dbo.Data0089.rkey asc';
      ExecSQL;
     end;

    with dm.ADOQuery1 do   //复制35 ecn履历表
    begin
     close;
     sql.Text:='INSERT INTO DATA0035 '+
      '(part_ptr,serial_no,part_number,text,source,if_gerber,create_employee,'+#13+
      'engineer,ecn_no,enter_date) '+#13+
      'SELECT '+dm.AQY0025RKEY.AsString+' as part_ptr,serial_no,part_number,text,'+#13+
      'source,if_gerber,create_employee,engineer,ecn_no,enter_date '+#13+
      'FROM Data0035'+#13+
      'where part_ptr='+inttostr(parent);
     ExecSQL;
    end;

    with dm.ADOQuery1  do      //阻抗30
    begin
      Close;
      sql.Text:='INSERT INTO DATA0030 '+
     '(SEQ_NO, SOURCE_PTR, type, MARK, layer, refe_layer, line_width, line_ofsight,'+
     'impedance, adjust_linewidth, adjust_lineofsight, adjust_impedance,'+
     'product_impedance, impedance_scope, orig_juli, adjust_jiuli) '+
     'SELECT SEQ_NO,'+dm.AQY0025RKEY.AsString+' as SOURCE_PTR, type, MARK, layer, '+
     'refe_layer, line_width,line_ofsight, impedance, adjust_linewidth, adjust_lineofsight,'+
     'adjust_impedance,product_impedance, impedance_scope, orig_juli, adjust_jiuli '+
     'FROM  DATA0030 AS DATA0030_1 '+
     'WHERE  (SOURCE_PTR = '+inttostr(parent)+')';
     ExecSQL;
    end;

   { with dm.ADOQuery1 do
     begin
      close;
      sql.Text:= 'insert into data0011 '+
       '(FILE_POINTER,SOURCE_TYPE,memo_text) '+
       'select '+dm.AQY0025RKEY.AsString+' as FILE_POINTER,SOURCE_TYPE,memo_text'+#13+
       'from data0011 where SOURCE_TYPE=25 and'+#13+
       'FILE_POINTER='+inttostr(parent);
      ExecSQL;
     end;
     }
   end;
  end;       //结束循环新增

  dm.adsa273.Close;
  dm.adsa273.Parameters[0].Value:=null;
  dm.adsa273.Open;
  dm.adsa273.Append;
  dm.adsa273CUSTOMER_PTR.Value:=strtoint(rkey10.Caption);
  dm.adsa273COPYFROMCUST_PTR.Value:=strtoint(rkey25.Caption);
  dm.adsa273CUSTOMER_PART_PTR.Value:=toprkey25;
  dm.adsa273ENTERED_BY.Value:= strtoint(user_ptr);
  dm.adsa273ENTERED_DATE.Value:=getsystem_date(dm.adoquery2,1);
  dm.adsa273last_modi_by_ptr.Value:= dm.adsa273ENTERED_BY.Value;
  dm.adsa273last_modi_date.Value:=getsystem_date(dm.adoquery2,0);
  if radiobutton1.Checked then
   dm.adsa273Tooling_close.Value:=1
  else if radiobutton2.Checked then
   dm.adsa273Tooling_close.Value:=2
  else if radiobutton3.Checked then
   dm.adsa273Tooling_close.Value:=3
  else dm.adsa273Tooling_close.Value:=4;
  dm.adsa273text.Value:=memo1.Text;
  dm.adsa273ECNSTART.Value:=radiogroup2.ItemIndex;
  dm.adsa273ECN_NO.Value:=edit1.Text;
  dm.adsa273STATUS.Value:=0;
  dm.adsa273SOURCE.Value:=radiogroup1.ItemIndex+1;
  dm.adsa273del.Value:=strtoint(sales_flag.Caption);
  dm.adsa273.Post;

  dm.ADs04.Close;
  dm.ADs04.Open;
  if dm.ADs04SEED_FLAG.Value<>1 then
   self.update_04(trim(edit1.Text));

  if checkbox1.Checked then update_08;     //是否更新初始值

  if dm.adsa273del.Value=0 then           //是否将旧版本暂缓
   UPDATEDATA0025(radiogroup2.ItemIndex,dm.adsa273COPYFROMCUST_PTR.Value);

  if dm.adsa273Tooling_close.Value=4 then
   self.append_log119(dm.adsa273CUSTOMER_PART_PTR.Value);

  dm.ADOConnection1.CommitTrans;
  dm.AQY0025.Close;
  dm.ads502.Close;
  dm.ADS38.Close;
  dm.ads494.Close;
  dm.ads497.Close;
  dm.ads279.Close;
  dm.ADOQuery1.Close;
  dm.ADOQuery2.Close;

  messagedlg('ECN数据复制成功!',mtinformation,[mbok],0);
  screen.Cursor:=crdefault;
  self.ModalResult:=mrok;
 except
  on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   screen.Cursor:=crdefault;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
 end; //end try
 
end;

procedure TForm2.Button1Enter(Sender: TObject);
begin
 if trim(edit1.Text)='' then
 begin
  messagedlg('ENC编号不允许为空!',mterror,[mbcancel],0);
  edit1.SetFocus;
  exit;
 end;

 if not groupbox1.Enabled then
 begin
  messagedlg('请选择变更前本厂编号!',mterror,[mbcancel],0);
  edit3.SetFocus;
  exit;
 end;

 if trim(edit5.Text)='' then
 begin
  messagedlg('变更后本厂编号不允许为空!',mterror,[mbcancel],0);
  edit5.SetFocus;
  exit;
 end;

 if not dm.ADs04.Active then
  dm.ADs04.Open;
 if (dm.ADs04SEED_FLAG.Value<>1) then
  if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
   begin
    messagedlg('ECN编号最后一位必需是一个整数!',mtinformation,[mbok],0);
    edit1.SetFocus;
    exit;
   end;

 if self.findpart_emptyerror then
 begin
  messagedlg('变更后所有线路层编号不允许为空!',mterror,[mbcancel],0);
  treeview2.SetFocus;
  exit;
 end;

end;

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
 if (not checkbox1.Checked) and ((sender as Tradiobutton).Checked)
    and (Trim(Edit3.Text)<>'') then
  begin
   if radiogroup1.ItemIndex=0 then        //内部变更 修改版本最后一位
    edit5.Text:=copy(trim(edit3.Text),1,
                     length(trim(edit3.Text))-1)+
                     succ(edit3.text[length(trim(edit3.Text))])
   else                                   //外部变变更 修改版本倒数第二位
    edit5.Text:=copy(trim(edit3.Text),1,
                     length(trim(edit3.Text))-2
                     )+
                     succ(edit3.text[length(trim(edit3.Text))-1])+
                     edit3.text[length(trim(edit3.Text))];
  end;
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
//var
// target,CUSTSTASHIP:string;
// wz:Integer;
begin
if (not checkbox1.Checked) and (radiobutton2.Checked)
    and (Trim(Edit3.Text)<>'') then
begin

{  with dm.ADOQuery2 do
  begin
    Close;
    SQL.Text:='select CUSTSTASHIP,CUSTSTATOOL from data0192';
    open;
    CUSTSTASHIP:=fieldbyname('CUSTSTASHIP').AsString;    //流水号是否在前Y/N
  end;

  with dm.ADOQuery2 do
  begin
   close;
   sql.Text:='select data0008.PRECHAR1,data0008.PRECHAR2,'+#13+
    'data0081.sufchar from data0081'+#13+
    'inner join data0008 on data0081.rkey=data0008.layer_pre'+#13+
    'where data0008.rkey='+rkey08.Caption;
   open;
   if Trim(FieldByName('sufchar').AsString)<>'' then
    wz:=Length(Trim(FieldByName('sufchar').AsString))
   else
    wz:=1;
  end;    }

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select SUBSTRING(data0015.part_templet, 1, 1) as char2,'+
                    'SUBSTRING(data0015.part_batch, 1, 1) as char1 '+
   ' from data0015'+#13+
            'where data0015.rkey='+rkey15.Caption;
   open;
  end;
  edit5.Text:=             //样板字符替换批量字符
  StringReplace(Edit3.Text,Trim(dm.ADOQuery1.fieldbyname('char1').asstring),
                Trim(dm.ADOQuery1.fieldbyname('char2').asstring),[]);

{ if  CUSTSTASHIP='Y' then
   if Trim(dm.ADOQuery1.fieldbyname('char').asstring)<>'' then
    begin
     target:=edit3.Text;
     delete(target,wz+1,1);
     insert(dm.ADOQuery1.fieldbyname('char').asstring,target,wz+1);
     edit5.Text:= target;
    end
   else
 else           //流水号在后，第一位为量产或者样板
 if Trim(dm.ADOQuery1.fieldbyname('char').asstring)<>'' then
  begin
   target:=edit3.Text;
   delete(target,1,1);
   insert(dm.ADOQuery1.fieldbyname('char').asstring,target,1);
   edit5.Text:= target;
  end;
 } 
end;
end;

procedure TForm2.RadioButton4Click(Sender: TObject);
//var
// target,CUSTSTASHIP:string;
// wz:Integer;
begin
if (not checkbox1.Checked) and (radiobutton4.Checked)
   and (Trim(Edit3.Text)<>'')then
begin
 {
  with dm.ADOQuery2 do
  begin
    Close;
    SQL.Text:='select CUSTSTASHIP,CUSTSTATOOL from data0192';
    open;
    CUSTSTASHIP:=fieldbyname('CUSTSTASHIP').AsString;    //流水号是否在前Y/N
  end;

  with dm.ADOQuery2 do
  begin
   close;
   sql.Text:='select data0008.PRECHAR1,data0008.PRECHAR2,'+#13+
    'data0081.sufchar from data0081'+#13+
    'inner join data0008 on data0081.rkey=data0008.layer_pre'+#13+
    'where data0008.rkey='+rkey08.Caption;
   open;
   if Trim(FieldByName('sufchar').AsString)<>'' then
    wz:=Length(Trim(FieldByName('sufchar').AsString))
   else
    wz:=1;
  end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select SUBSTRING(data0015.part_batch, 1, 1) as char from data0015'+#13+
            'where data0015.rkey='+rkey15.Caption;
   open;
  end;
  if  CUSTSTASHIP='Y' then
   if Trim(dm.ADOQuery1.fieldbyname('char').asstring)<>'' then
    begin
     target:=edit3.Text;
     delete(target,wz+1,1);
     insert(dm.ADOQuery1.fieldbyname('char').asstring,target,wz+1);
     edit5.Text:= target;
    end
   else
  else           //流水号在后，第一位为量产或者样板
  if not dm.ADOQuery1.IsEmpty then
   begin
    target := edit3.Text;
    delete(target,1,1);
    insert(dm.ADOQuery1.fieldbyname('char').asstring,target,1);
    edit5.Text := target;
   end;}

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select SUBSTRING(data0015.part_templet, 1, 1) as char2,'+
                    'SUBSTRING(data0015.part_batch, 1, 1) as char1 '+
   ' from data0015'+#13+
            'where data0015.rkey='+rkey15.Caption;
   open;
  end;
  edit5.Text:=                   //批量字符替换样板
  StringReplace(Edit3.Text,Trim(dm.ADOQuery1.fieldbyname('char2').asstring),
                Trim(dm.ADOQuery1.fieldbyname('char1').asstring),[]);
   
end;
end;

end.


