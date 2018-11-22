unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils, common,Frm_detail_u,Pick_Item_Single,ConstVar;

type
  TFrm_main = class(TForm)
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
    ADOConnection1: TADOConnection;
    tmp: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dtt1: TDateTimePicker;
    dtt2: TDateTimePicker;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label1: TLabel;
    Button1: TButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
//    wh_ptr:integer;
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
    function clearalais(cols:string):string;
  end;

var
  Frm_main: TFrm_main;

implementation


{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not app_init_2(ADOConnection1) then
  begin
    showmsg('程序启动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//  user_ptr:='4';
//  vprev:='4';
//  ADOConnection1.Open;

  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  dtpk2.Date:=now;
  dtpk1.Date:=IncMonth(Now,-1);
  ListBox3.ItemIndex:=0;
end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.ListBox3Click(Sender: TObject);
begin
  OutputDebugString(PChar(IntToStr(ListBox3.ItemIndex)+':'+listbox3.Items[listbox3.itemindex]));
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit3.Visible:=listbox3.ItemIndex in [0..7,11];
  button3.Enabled:=listbox3.ItemIndex in [8..10,12];
  combobox1.Visible:=listbox3.ItemIndex in [8,9,12];
  bitbtn6.Visible:=listbox3.ItemIndex in [0..3,5..7,11];
  RadioButton1.Checked:=true;
  RadioButton4.Visible:=listbox3.ItemIndex<>4;
  GroupBox1.Visible:=edit3.Visible;
  groupbox2.Visible :=listbox3.ItemIndex=10;

  case listbox3.ItemIndex of
   8:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('量产');
    combobox1.Items.Add('样板');
    combobox1.ItemIndex:=0;
   end;
   9:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('自制');
    combobox1.Items.Add('外发');
    combobox1.Items.Add('半制程');
    combobox1.ItemIndex:=0;
   end;
   12:
   begin
    combobox1.Items.Clear;
    combobox1.Items.Add('未确认');
    combobox1.Items.Add('已确认');
    combobox1.Items.Add('已投产');
    combobox1.ItemIndex:=0;
   end;
  end;
end;

procedure TFrm_main.Edit3Change(Sender: TObject);
begin
  button3.Enabled:=trim(edit3.Text)<>'' ;
end;

procedure TFrm_main.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if listbox3.ItemIndex=4 then
   if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
    abort;
 if (key=#13) and (button3.Enabled=true) then
   button3.SetFocus;
end;

procedure TFrm_main.N1Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TFrm_main.update_sgrid(sgrid_row: byte);
var
  s,s1:string;
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
    end ;
  end;

begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  if (listbox3.itemindex in [8,9,12])  then
 //   sgrid1.Cells[1,sgrid_row]:=edit3.Text
//  else
    sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
   
  case listbox3.ItemIndex of
   0:Con('and data0025.manu_part_number');
   1:Con('and data0025.manu_part_desc');

   2:Con('and data0010.cust_code');
   3:Con('and data0008.prod_code');
   4:Con('and data0025.layers');

   5:Con('and data0015.warehouse_code');
   6:Con('and data0007.pr_grp_code');
   7:Con('and data0005.EMPL_CODE');

   8:sgrid1.Cells[2,sgrid_row]:='and data0025.ttype = '+inttostr(ComboBox1.ItemIndex);
   9:sgrid1.Cells[2,sgrid_row]:='and data0060.so_tp = '+inttostr(ComboBox1.ItemIndex);

   10:
   begin
          s1:= '';
          s := '';
          if CheckBox1.Checked then
            begin
              s1 := s1 + CheckBox1.Caption  + ';' ;
              if s = '' then
               s := '1'
              else
               s := s + ',1';
            end;
          if CheckBox2.Checked then
            begin
              s1 := s1 + CheckBox2.Caption + ';'  ;
              if s = '' then
                  s := '2'
              else
                  s := s + ',2';
            end;
          if CheckBox3.Checked then
           begin
            s1 := s1 + CheckBox3.Caption  + ';' ;
            if s = '' then
                s := '3'
            else
                s := s + ',3';
           end;
          if CheckBox4.Checked then
            begin
              s1 := s1 + CheckBox4.Caption + ';'  ;
              if s = '' then
                  s := '4'
              else
                  s := s + ',4';
            end;
          if CheckBox5.Checked then
            begin
              s1 := s1 + CheckBox5.Caption + ';'  ;
              if s = '' then
                  s := '5'
              else
                  s := s + ',5';
            end;
          if CheckBox6.Checked then
            begin
              s1 := s1 + CheckBox6.Caption + ';'  ;
              if s = '' then
                  s := '6'
              else
                  s := s + ',6';
            end;
            {}
          s := '('+s+')';
          sgrid1.Cells[1,sgrid_row] := s1;
          sgrid1.Cells[2,sgrid_row]:=' and data0060.STATUS in ' + s;
   end;
   11:Con('and data0025.ORIG_CUSTOMER');
   12:sgrid1.Cells[2,sgrid_row]:='and Data0060.PROD_REL = '+inttostr(ComboBox1.ItemIndex+1);
  end;
end;

procedure TFrm_main.Button3Click(Sender: TObject);
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

procedure TFrm_main.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    0:
    begin
      InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/89,MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74';
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
    1:
    begin
      InputVar.Fields := 'MANU_PART_DESC/客户型号/149,'+
                         'ANALYSIS_CODE_2/客户物料号/116,CUST_CODE/客户代码/74';
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
      inputvar.KeyField:='MANU_PART_DESC';
    end;
    2:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                       'data0010.abbr_name FROM dbo.Data0010 order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
    end;
    3:
    begin
      InputVar.Fields := 'PROD_CODE/产品类型/110,PRODUCT_NAME/类型名称/285';
      InputVar.Sqlstr :='SELECT RKEY, PROD_CODE, PRODUCT_NAME'+#13+
                        'FROM dbo.Data0008 order by PROD_CODE ';
      inputvar.KeyField:='PROD_CODE';
    end;
    5:
    begin
      InputVar.Fields:='WAREHOUSE_CODE/工厂代码/110,WAREHOUSE_NAME/工厂名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT rkey,warehouse_code,warehouse_name,abbr_name '+
                       'from data0015 order  by warehouse_code';
      inputvar.KeyField:='warehouse_code';
    end;
    6:
    begin
      InputVar.Fields:='pr_grp_code/组别代码/110,product_group_name/组别名称/251';
      InputVar.Sqlstr:='select pr_grp_code,product_group_name  from data0007 order by pr_grp_code';
      inputvar.KeyField:='pr_grp_code';
    end;
    7:
    begin
      InputVar.Fields:='EMPL_CODE/业务员代码/110,abbr_name/业务员名称/251';
      InputVar.Sqlstr:='select EMPL_CODE,abbr_name from data0005 order by EMPL_CODE';
      inputvar.KeyField:='EMPL_CODE';
    end;
    11:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                       'data0010.abbr_name FROM dbo.Data0010 order  by abbr_name';
      inputvar.KeyField:='abbr_name';
    end;

  end;

  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case self.ListBox3.ItemIndex of
     0:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
     1:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
     2:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
     3:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PROD_CODE']);

     5:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
     6:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['pr_grp_code']);
     7:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']);
    11:edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['abbr_name']);
    end;
    button3.SetFocus;
  end else edit3.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
var i:integer;
    select,selectrate,where,wheredate,group,order:string;
begin
  screen.Cursor:=crappstart;
  selectrate:= ' round(sum(isnull(d360.flag,0))*100.0/(count(*)*1.0),4) as rate, sum(isnull(d360.flag,0)) as sec, count(flag) as total    ';
  wheredate :='BETWEEN :p1 AND :p2 ';
  case radiogroup1.ItemIndex of
   0:
    begin
      select:='convert(varchar,d360.SCH_DATE,23) as [交货日期], null as name,';
      group:='GROUP BY CONVERT(varchar,d360.SCH_DATE,23) ';
      order:='ORDER BY CONVERT(varchar,d360.SCH_DATE,23)';
    end;

   1:
    begin
      select:='datepart(yy,d360.SCH_DATE)*100+datepart(mm,d360.SCH_DATE) as [月份],null as name,';
      group:='GROUP BY datepart(yy,d360.SCH_DATE)*100+datepart(mm,d360.SCH_DATE) ';
      order:='ORDER BY datepart(yy,d360.SCH_DATE)*100+datepart(mm,d360.SCH_DATE)';
    end;

   2:
    begin
     select:='pr_grp_code as [产品组别], product_group_name as [组别名称],';
     group:='GROUP BY pr_grp_code, product_group_name ';
     order:='ORDER BY pr_grp_code ';
    end;
   3:
    begin
     select:='EMPL_CODE as [工号],EMPLOYEE_NAME as [姓名],';
     group:='GROUP BY EMPL_CODE,EMPLOYEE_NAME ';
     order:='ORDER BY EMPL_CODE ';
    end;
   4:
    begin
     select:='PROD_CODE as [类型代码],PRODUCT_NAME as [类型名称],';
     group:='GROUP BY PROD_CODE,PRODUCT_NAME ';
     order:='ORDER BY PROD_CODE ';
    end;
   5:
    begin
     select:='CUST_CODE as [客户代码], null as name,';
     group:='GROUP BY CUST_CODE ';
     order:='ORDER BY CUST_CODE ';
    end;
   6:
    begin
     select:='MANU_PART_NUMBER as [本厂编号],MANU_PART_DESC as [客户型号],';
     group:='GROUP BY MANU_PART_NUMBER,MANU_PART_DESC ';
     order:='ORDER BY MANU_PART_NUMBER ';
    end;
  end;



  selectrate:=' select '+ select+selectrate+
        'FROM dbo.Data0060 INNER JOIN '+#13+
        '     dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN '+#13+
        '     dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN '+#13+
        '     dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN '+#13+
        '     dbo.Data0005 ON dbo.Data0060.COMM_ASSIGNED_BY_E_P = dbo.Data0005.RKEY INNER JOIN '+#13+
        '     dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data0015.RKEY inner join '+
        '     data0007 on data0008.PR_GRP_POINTER=data0007.rkey INNER JOIN'+
        '(SELECT     so_ptr,sch_date, CONVERT(int, CASE WHEN complete_flag IS NULL THEN CASE WHEN sch_date < getdate() THEN 0 ELSE NULL '
        + #13#10 +
        '                                              END ELSE complete_flag END) AS flag'
        + #13#10 + '                       FROM          dbo.data0360' +
        #13#10 +
        '                       WHERE  ( sch_date '+wheredate+')) AS d360 ON d360.so_ptr = dbo.Data0060.RKEY ';
        
  where:='WHere (dbo.Data0060.so_style = 0 ) and (Data0060.status<>2)  ';
  for i:=1 to sgrid1.RowCount-2 do  where:=where+sgrid1.Cells[2,i]+' ';


  if (vprev='1') or (vprev='2') then
    where:=where+' and data0010.rkey in (SELECT  CUSTOMER_PTR '+ #13 +
                 ' FROM dbo.DATA0100 '+ #13 +
                 ' WHERE  CSI_PTR = '+rkey73+' )';


  with  TFrm_detail.Create(nil) do
  try
    ttype:=RadioGroup1.ItemIndex;
    ttype_name:=radiogroup1.Items[radiogroup1.itemindex];
    ADOQuery1.Connection:=ADOConnection1;
    tmp.Connection:=ADOConnection1;
    mainqry.Connection:=ADOConnection1;
    subads.Connection:=ADOConnection1;
    with tmp do
    begin
      Close;
      SQL.Text:= 'SELECT RKEY,ABBR_NAME FROM DATA0015 ORDER BY RKEY';
      Open;
      IF NOT IsEmpty then
      begin
        while not eof do
        begin
          whcb.Items.AddObject(Fields[1].AsString,Pointer(Fields[0].AsInteger));
          Next;
        end;
      end;
    end;
    if ttype>1 then
    with tmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text :='select distinct year(getdate())-number as y '+
                     'from master.dbo.spt_values '  +
                     'where (number BETWEEN 0 AND 4) ' +
                     'order by y desc';
      Open;
      ytype.Clear;
      while not Eof do
      begin
       ytype.Items.Add(FieldByName('y').asString);
       Next;
      end ;
      Close;
      SQL.Clear;
      SQL.Text:=Format('select %s isnull(t1.[1],0) as [一月份],isnull(t1.[2],0) as [二月份],'  + #13#10 +
          '	isnull(t1.[3],0) as [三月份],isnull(t1.[4],0) as [四月份],' + #13#10 +
          '	isnull(t1.[5],0) as [五月份],isnull(t1.[6],0) as [六月份] ,' + #13#10 +
          '	isnull(t1.[7],0) as [七月份],isnull(t1.[8],0) as [八月份],'  + #13#10 +
          '	isnull(t1.[9],0) as [九月份],isnull(t1.[10],0) as [十月份] ,' + #13#10 +
          '	isnull(t1.[11],0) as [十一月份],isnull(t1.[12],0) as [十二月份]' + #13#10 +
          'from (select  %s yy,mm, case when count(flag)=0 then 0 else'+ #13#10 +
          '    cast( (sum(isnull(flag,0))* 100.0 / count(flag)) as decimal(5,2) )end as  ontime'+ #13#10 +
          'from (select so_ptr, year(sch_date) as yy, month(sch_date) as mm,'+ #13#10 +
          'case when complete_flag is null then case when sch_date<getdate() then 1-1 else null'+
          '  end   else complete_flag end as flag'+ #13#10 +
          'from data0360' + #13#10 + 'where sch_date>= :bd and sch_date< :ed '
          + #13#10 + ') d360 inner join ' + #13#10 + '  data0060 on data0060.rkey= d360.so_ptr inner join' + #13#10 +
          '  data0010 on data0010.rkey= data0060.CUSTOMER_PTR inner join' + #13#10 +
          '  data0005 on data0060.COMM_ASSIGNED_BY_E_P = data0005.rkey inner join'+ #13#10 +
          '  Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY inner join'+ #13#10 +
          '  Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY inner join'+ #13#10 +
          '  data0007 on data0008.PR_GRP_POINTER= data0007.rkey'+ #13#10 +
          '   %s ,yy,mm) dataall' +#13#10 +
          'PIVOT (  avg(ontime)  FOR mm IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) ) AS t1 '
          + #13#10 + '%s',[select,clearalais(select),group,order]);
    end;
    with ADOQuery1 do
    begin
      close;
      SQL.Clear;
      sql.Add(selectrate+where+' '+#13+group+' '+#13+order);
      Parameters.ParamByName('p1').Value:=dtpk1.DateTime;
      Parameters.ParamByName('p2').Value:=dtpk2.DateTime;
      open;
    end;
    ShowModal;
  finally
    Free;
  end;
  screen.Cursor:=crdefault;
end;

function TFrm_main.clearalais(cols: string): string;
var
  i:Integer;
begin
  i:=Pos('[',cols);
  while i>0 do
  begin
    i:=Pos('as',cols);
    Delete(cols,i,Pos(']',cols)+1-i);
    i:=Pos('[',cols);
  end;
  Result:=cols;
end;

procedure TFrm_main.Button1Click(Sender: TObject);
begin
  MessageBox(Handle, '1.此程序查询结果不包含备品订单' + #13#10 + 
    '2.单批交期计算方式为' + #13#10 +
    '   当交期已到时 剩余未入库为日需入库数量' + #13#10 + 
    '   当交期未到时 剩余未入库除以剩余交期天数为日需入库数量' + #13#10 + 
    '3.上部总览的数量为所有批次日需入库数量之和' + #13#10 + 
    '4.订单的日需入库数量每日或有入库后会发生变化为正常现象' + #13#10 +
    '5.本程序区分可看绑定客户或看所有客户' + #13#10 +
    '6.本程序交期分析只分析2015年下单的问题' + #13#10 +
   // '7.本程序交期分析只分析2015年下单的问题' + #13#10 +
    #13#10 + '如对以上规则有异议请联系ERP小组(邮件可发)', '注意', MB_OK +
    MB_ICONINFORMATION);

end;

end.
