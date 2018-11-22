unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils;

type
  Tmain_form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    ADOQuery1: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dtt1: TDateTimePicker;
    dtt2: TDateTimePicker;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup2: TRadioGroup;
    RadioButton5: TRadioButton;
    chk1: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SGrid1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
  private
    { Private declarations }
    wh_ptr:integer;
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
  end;

var
  main_form: Tmain_form;

implementation

uses Pick_Item_Single,ConstVar,common,detail, demo;

{$R *.dfm}

procedure Tmain_form.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;    
  self.caption:=application.Title;


  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//  user_ptr:='4';
//  vprev:='4';
//  ADOConnection1.Open;
end;

procedure Tmain_form.FormActivate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  listbox3.Selected[0]:=true;
  self.ListBox3.OnClick(sender);
  dtpk2.Date:=getsystem_date(adoquery1,1);
  dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;
end;

procedure Tmain_form.BitBtn3Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tmain_form.ListBox3Click(Sender: TObject);
var TmpAdo:TADOQuery;
begin
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit3.Visible:=not (listbox3.ItemIndex in [1,7,8,14]);
  button3.Enabled:=listbox3.ItemIndex in [1,7,8,14];
  combobox1.Visible:=listbox3.ItemIndex in [1,7,8,14];   //14为产品阶数
  bitbtn6.Visible:=listbox3.ItemIndex in [0,2..5,10,11];
  
  RadioButton1.Checked:=true;
  RadioButton4.Visible:=listbox3.ItemIndex<>9;
  RadioButton5.Visible:=not (listbox3.ItemIndex in [0,2..6,11,13]);
  GroupBox1.Visible:=listbox3.ItemIndex in [0,2..6,9,11,13];


  case listbox3.ItemIndex of
   0,2..6,9,10,12:;
   1:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('工厂报废');
    combobox1.Items.Add('供应商报废');
    combobox1.Items.Add('客户报废');
    combobox1.Items.Add('市场报废');
    combobox1.Items.Add('其它');
    combobox1.ItemIndex:=0;
   end;
   7:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('量产');
    combobox1.Items.Add('样板');
    combobox1.ItemIndex:=0;
   end;
   8:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('内层');
    combobox1.Items.Add('外层');
    combobox1.ItemIndex:=0;
   end;
   14:
   begin
    try
      TmpAdo:=TADOQuery.Create(Application);
      TmpAdo.Connection:=DM.ADOConnection1;
      try
        combobox1.Items.Clear;
        combobox1.Style:=csDropDown;
        TmpAdo.Close;
        TmpAdo.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
        TmpAdo.Open;
        while not TmpAdo.Eof do
        begin
          combobox1.Items.Add(TmpAdo.FieldBYName('tvalue').AsString);
          TmpAdo.Next;
        end;
        combobox1.ItemIndex:=0;
      except
        tmpAdo.Close;
        tmpAdo.Connection := nil;
        tmpAdo.Free;
        tmpAdo := nil;
      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
  end;


  end; //end case
end;

procedure Tmain_form.Edit3Change(Sender: TObject);
begin
  button3.Enabled:=trim(edit3.Text)<>'' ;
end;

procedure Tmain_form.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if listbox3.ItemIndex=9 then
   if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
    abort;
 if (key=#13) and (button3.Enabled=true) then
   button3.SetFocus;
end;

procedure Tmain_form.Edit3Exit(Sender: TObject);
begin
  if (trim(edit3.Text)<>'') and (listbox3.ItemIndex in [10]) then
  with ADOQuery1 do
  begin
    Close;
    case listbox3.ItemIndex of
      0:sql.Text:='select rej_code from data0039 where rej_code='''+trim(edit3.text)+'''';
      2:sql.Text:='select dept_code from data0034 where (ttype<>''2'') and (ttype<>''3'') '+
                  'and dept_code='''+trim(edit3.text)+'''';
      3:sql.Text:='select cust_code from data0010 where cust_code='''+trim(edit3.text)+'''';
      4:sql.Text:='select prod_code from data0008 where prod_code='''+trim(edit3.text)+'''';
      10:sql.Text:='select rkey,warehouse_code from data0015 where warehouse_code='''+trim(edit3.text)+'''';
    end;
    open;
    if isempty then
    begin
      case listbox3.ItemIndex of
       { 0:showmessage('您输入的缺陷代码不存在，请重输！');
        2:showmessage('您输入的部门代码不存在，请重输！');
        3:showmessage('您输入的客户代码不存在，请重输！');
        4:showmessage('您输入的产品类型不存在，请重输！');}
        10:showmessage('您输入的工厂代码不存在，请重输！');
      end; //case结束
      edit3.Text:='';
      edit3.SetFocus;
    end
    else if listbox3.ItemIndex=10 then
      wh_ptr:=fieldvalues['rkey'];
  end;
end;

procedure Tmain_form.SGrid1Click(Sender: TObject);
begin
  if button3.Enabled then button3click(sender);
end;

procedure Tmain_form.SGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
 if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if row<>0 then SGrid1.Row:=row;
 end
 else if button3.Enabled then button3.OnClick(sender);
end;

procedure Tmain_form.N1Click(Sender: TObject);
var i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure Tmain_form.BitBtn2Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure Tmain_form.update_sgrid(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton1.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton1.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit3.Text+''' ';
    end else if RadioButton2.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton2.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' <> '''+edit3.Text+''' ';
    end else if RadioButton3.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton3.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' > '''+edit3.Text+''' ';
    end else if RadioButton4.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton4.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit3.Text+'%'' ';
    end  else if RadioButton5.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton5.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' < '''+edit3.Text+''' ';
    end ;
  end;

begin
 sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid_row]:=edit3.Text;

 case listbox3.ItemIndex of
   0:Con('and Data0039.REJ_CODE');
   1:
    begin
     sgrid1.Cells[2,sgrid_row]:='and data0039.REJ_TYPE = '+inttostr(combobox1.ItemIndex);
     sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
   2:Con('and Data0034.dept_code');
   3:Con('and Data0010.CUST_CODE');
   4:Con('and data0008.prod_code');
   5:Con('and data0025.manu_part_number');
   6:Con('and data0025.manu_part_desc');
   7:
    begin
     sgrid1.Cells[2,sgrid_row]:='and Data0025.ttype = '+inttostr(combobox1.ItemIndex);
     sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
   8:
    begin
     if combobox1.ItemIndex=0 then
       sgrid1.Cells[2,sgrid_row]:='and data0025.PARENT_PTR  > 0 '
     else sgrid1.Cells[2,sgrid_row]:='and data0025.PARENT_PTR  IS NULL ';
     sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
    end;
   9: Con('and data0025.layers');
   10:sgrid1.Cells[2,sgrid_row]:='and D58.warehouse_ptr = '+inttostr(wh_ptr);
   //10:sgrid1.Cells[2,sgrid_row]:='and Data0492.whouse_ptr = '+inttostr(wh_ptr);
   11:Con('and data0007.pr_grp_code');
   12: sgrid1.Cells[2,sgrid_row]:='and data0025.SAMPLE_NR LIKE ''%'+edit3.Text+'%''';
   13:Con('and data0006.CUT_NO');
   14:
   begin
     if (Trim(combobox1.Text)='') then
     begin
       sgrid1.Cells[2,sgrid_row]:=' and 1=1';
       sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
     end else
     begin
       sgrid1.Cells[2,sgrid_row]:=' and data0025.CPJS like ''%'+combobox1.Text+'%''';
       sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
     end;
   end;
 end;
end;

procedure Tmain_form.Button3Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
  begin
    self.update_sgrid(i);
    exit;
  end;
 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure Tmain_form.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
 try
  case self.ListBox3.ItemIndex of
    0:
    begin
      InputVar.Fields:='REJ_CODE/缺陷代码/104,REJECT_DESCRIPTION/缺陷名称/175,类别/类别/50,类型/类型/71';
      InputVar.Sqlstr:='SELECT RKEY,REJ_CODE,REJECT_DESCRIPTION,case REJECT_DEFECT_FLAG '+
        'when ''D'' then ''不良品'' when ''R'' then ''报废品'' end as 类别,'+
        'case rej_type when 0 then ''工厂报废'' when 1 then ''供应商报废'' '+
        'when 2 then ''客户报废'' when 3 then ''市场报废'' when 4 then ''其它'' end as 类型 '+
        'FROM  Data0039 ORDER BY REJ_CODE';
      inputvar.KeyField:='REJ_CODE';
    end;
    2:
    begin
      InputVar.Fields:='DEPT_CODE/工序代码/106,DEPT_NAME/工序名称/221,性质/性质/65';
      InputVar.Sqlstr:='SELECT rkey,DEPT_CODE, DEPT_NAME,BARCODE_ENTRY_FLAG,'+
        'case data0034.ttype when ''1'' then  ''生产工序'' '+
        'when ''4'' then ''行政部门'' when ''5'' then ''生产班组'' end as 性质'+#13+
        'FROM dbo.Data0034'+#13+
        'WHERE (TTYPE <> ''2'') and (TTYPE <> ''3'')'+#13+
        'ORDER BY DEPT_CODE';
      inputvar.KeyField:='DEPT_CODE';
    end;
    3:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
      'data0010.abbr_name FROM dbo.Data0010 order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
    end;
    4:
    begin
      InputVar.Fields := 'PROD_CODE/产品类型/110,PRODUCT_NAME/类型名称/285';
      InputVar.Sqlstr :='SELECT RKEY, PROD_CODE, PRODUCT_NAME'+#13+
        'FROM dbo.Data0008'+#13+
        'order  by PROD_CODE';
      inputvar.KeyField:='PROD_CODE';
    end;
    5:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
        'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74,ABBR_NAME/客户简称/84';
      InputVar.Sqlstr :='SELECT dbo.Data0025.PROD_CODE_PTR, dbo.Data0008.PROD_CODE,'+#13+
        'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,'+#13+
        'dbo.Data0010.ABBR_NAME, dbo.Data0025.RKEY AS rkey25,'+#13+
        'dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
        'dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.set_lngth, dbo.Data0025.set_width,'+#13+
        'dbo.Data0025.set_qty'+#13+
        'FROM dbo.Data0025 INNER JOIN dbo.Data0008 '+
        'ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN dbo.Data0010 '+
        'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
        'order by dbo.Data0025.MANU_PART_NUMBER';
      inputvar.KeyField:='MANU_PART_NUMBER';
    end;
    10:
    begin
      InputVar.Fields:='WAREHOUSE_CODE/工厂代码/110,WAREHOUSE_NAME/工厂名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT rkey,warehouse_code,warehouse_name,abbr_name '+
        'from data0015 order  by warehouse_code';
      inputvar.KeyField:='warehouse_code';
    end;
    11:
    begin
      InputVar.Fields:='pr_grp_code/组别代码/110,product_group_name/组别名称/251';
      InputVar.Sqlstr:='select pr_grp_code,product_group_name  from data0007 order by pr_grp_code';
      inputvar.KeyField:='pr_grp_code';
    end;
  end;   //end case
  
  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['REJ_CODE']);
     2:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']);
     3:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     4:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PROD_CODE']);
     5:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     10:
     begin
       edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
       wh_ptr:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
     end;
     11:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['pr_grp_code']);
    end;
    button3.SetFocus;
  end
  else edit3.SetFocus;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try
end;

procedure Tmain_form.BitBtn1Click(Sender: TObject);
var i:byte;
    select,where,group,order:string;
    tablename:string;
begin
 try
  tablename:= 'Data0058';
  screen.Cursor:=crappstart; //执行程序光标,等待...
  case radiogroup1.ItemIndex of
   0:
    begin
     select:='SELECT TOP 100 PERCENT CONVERT(varchar,D58.TDATETIME,23) as code,''空列'' as name,';
     group:='GROUP BY CONVERT(varchar,D58.TDATETIME,23) ';
     order:='ORDER BY CONVERT(varchar,D58.TDATETIME,23)';  //为了把汇总记录排在首行。
    end;
   1:
    begin
     select:='SELECT TOP 100 PERCENT CONVERT(varchar,year(D58.TDATETIME)*100+month(D58.TDATETIME),23) as code,''空列'' as name,';
     group:='GROUP BY DATEPART(yy,D58.TDATETIME) * 100 + DATEPART(mm,D58.TDATETIME) ';
     order:='ORDER BY DATEPART(yy,D58.TDATETIME) * 100 + DATEPART(mm,D58.TDATETIME)';
    end;
   2:
    begin
     select:='SELECT TOP 100 PERCENT data0034.dept_code as code,data0034.dept_name as name,';
     group:='GROUP BY data0034.dept_code,data0034.dept_name ';
     order:='ORDER BY ROUND(SUM(D58.QTY_REJECT * dbo.Data0025.unit_sq), 2) DESC ';
    end;
   3:
    begin
     select:='SELECT TOP 100 PERCENT Data0039.REJ_CODE as code,Data0039.REJECT_DESCRIPTION as name,';
     group:='GROUP BY Data0039.REJ_CODE,Data0039.REJECT_DESCRIPTION ';
     order:='ORDER BY ROUND(SUM(D58.QTY_REJECT * dbo.Data0025.unit_sq), 2) DESC ';
    end;
   4:
    begin
     select:='SELECT TOP 100 PERCENT Data0008.PROD_CODE as code,Data0008.PRODUCT_NAME as name,';
     group:='GROUP BY Data0008.PROD_CODE,Data0008.PRODUCT_NAME ';
     order:='ORDER BY ROUND(SUM(D58.QTY_REJECT * dbo.Data0025.unit_sq), 2) DESC ';
    end;
   5:
    begin
     select:='SELECT TOP 100 PERCENT Data0010.CUST_CODE as code,Data0010.ABBR_NAME as name,';
     group:='GROUP BY Data0010.CUST_CODE,Data0010.ABBR_NAME ';
     order:='ORDER BY ROUND(SUM(D58.QTY_REJECT * dbo.Data0025.unit_sq), 2) DESC ';
    end;
   6:
    begin
     select:='SELECT TOP 100 PERCENT Data0025.MANU_PART_NUMBER as code,Data0025.MANU_PART_DESC as name,';
     group:='GROUP BY Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC ';
     order:='ORDER BY ROUND(SUM(D58.QTY_REJECT * dbo.Data0025.unit_sq), 2) DESC ';
    end;
   7:  //17-5-19增加按责任工序和缺陷汇总
    begin
     select:='SELECT TOP 100 PERCENT data0034.dept_code as dept_code,data0034.dept_name as code,'+
             'Data0039.REJ_CODE as REJ_CODE,Data0039.REJECT_DESCRIPTION as name,';
     group:='GROUP BY data0034.dept_code,data0034.dept_name,Data0039.REJ_CODE ,Data0039.REJECT_DESCRIPTION  ';
     order:='ORDER BY ROUND(SUM(D58.QTY_REJECT * dbo.Data0025.unit_sq), 2) DESC ';
    end;
  end; //select 为sql的select语句
  select:=select+'SUM(D58.QTY_REJECT) AS qty_total,'+
  'ROUND(SUM(D58.QTY_REJECT*data0006.panel_ln*data0006.panel_wd*0.000001/data0006.PARTS_PER_PANEL),2) AS sqft_total_bb,'+
  'ROUND(SUM(D58.QTY_REJECT*Data0025.unit_sq),2) AS sqft_total ,' +
  'ROUND(SUM(D58.QTY_REJECT*data0006.panel_ln*data0006.panel_wd*0.000001/data0006.PARTS_PER_PANEL/dbo.GetParentNum(data0025.rkey)),2) as top_sqft_total_bb,'+
  'ROUND(SUM(D58.QTY_REJECT * dbo.Data0025.unit_sq/dbo.GetParentNum(data0025.rkey)),2) as top_sqft_total';

  where:='WHERE D58.TTYPE <> 2 '; //sql条件变量  2017-8-10 改成除成品报废外的报废
  for i:=1 to sgrid1.RowCount-2 do
    where:=where+sgrid1.Cells[2,i]+' ';
  where:=where+'and D58.TDATETIME >='+''''+(formatdatetime('yyyy-mm-dd ',dtpk1.Date)+
      formatdatetime('hh:nn:ss',dtt1.DateTime))+''''+
      ' and D58.TDATETIME <='+''''+(formatdatetime('yyyy-mm-dd ',dtpk2.Date)+
      formatdatetime('hh:nn:ss',dtt2.DateTime))+'''';

  detail_form:=Tdetail_form.Create(application);
  detail_form.ttype:=RadioGroup1.ItemIndex;  //分类汇总索引
  detail_form.v_bb:=self.RadioGroup2.ItemIndex;
  detail_form.ttype_name:=radiogroup1.Items[radiogroup1.itemindex];  //分类名称
  if chk1.Checked then tablename := 'Data0058IN'
  else tablename:= 'Data0058';
  with detail_form.ADOQuery1 do
  begin
    close;
    sql.text:=select+#13+#10+'FROM ' + tablename + ' D58 INNER JOIN Data0039 ON D58.REJECT_PTR=Data0039.RKEY '+
      'INNER JOIN Data0034 ON D58.RESP_DEPT_PTR=Data0034.RKEY '+
      'INNER JOIN Data0006 ON D58.WO_PTR=Data0006.RKEY '+
      'INNER JOIN Data0492 ON Data0006.cut_no=Data0492.cut_no '+
      'INNER JOIN Data0025 ON Data0006.BOM_PTR=Data0025.RKEY '+
      'INNER JOIN Data0010 ON Data0492.COMPLETED=Data0010.RKEY '+
      'INNER JOIN Data0008 ON Data0025.PROD_CODE_PTR=Data0008.RKEY '+
      'INNER JOIN Data0007 ON Data0008.pr_grp_Pointer=Data0007.RKEY '+#13+#10
      +where+' '+#13+#10+group+' '+#13+#10+order;
      
    Prepared;

    open;
  end;
  detail_form.ShowModal;
 finally
  detail_form.Free;
  screen.Cursor:=crdefault;
 end;
end;


end.
