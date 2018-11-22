unit putout_bill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB,
  dateutils, Menus;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    csi_ptr: TLabel;
    vprev: TLabel;
    db_ptr: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    aq457: TADODataSet;
    ado207: TADODataSet;
    ado208: TADODataSet;
    aq457RKEY: TAutoIncField;
    aq457GON_NUMBER: TStringField;
    aq457REF_NUMBER: TStringField;
    aq457CREATE_DATE: TDateTimeField;
    aq457ABBR_NAME: TStringField;
    aq457DEPT_CODE: TStringField;
    aq457DEPT_NAME: TStringField;
    aq457EMPLOYEE_NAME: TStringField;
    aq457DSDesigner2: TStringField;
    ado207INV_PART_NUMBER: TStringField;
    ado207INV_NAME: TStringField;
    ado207INV_DESCRIPTION: TStringField;
    ado207QUANTITY: TBCDField;
    ado207RTN_QUANTITY: TBCDField;
    ado207UNIT_NAME: TStringField;
    ado207rohs: TStringField;
    ado207SUPPLIER2: TStringField;
    ado208goods_name: TStringField;
    ado208goods_guige: TStringField;
    ado208goods_type: TStringField;
    ado208UNIT_NAME: TStringField;
    ado208rohs: TStringField;
    ado208REF_NUMBER: TStringField;
    ado208QUANTITY: TBCDField;
    ado208RTN_QUANTITY: TBCDField;
    ado208SOURCE_PTR: TIntegerField;
    ado207D0022_PTR: TIntegerField;
    aq457TTYPE: TSmallintField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ado208QUAN_ON_HAND: TBCDField;
    ado207QUAN_ON_HAND: TBCDField;
    ado207INVENTORY_PTR: TIntegerField;
    ado207rkey: TAutoIncField;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    ado207hand17: TFloatField;
    ado208rkey: TAutoIncField;
    N4: TMenuItem;
    aq457DSDesigner: TStringField;
    aq457DSDesigner3: TStringField;
    aq457dept_ptr: TIntegerField;
    ado207STANDARD_COST: TFloatField;
    ado207ttype: TSmallintField;
    ado207QUAN_ISSUED: TFloatField;
    ado207STATUS: TSmallintField;
    ado207D0468_PTR: TIntegerField;
    BitBtn2: TBitBtn;
    PopupMenu4: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    ado208dept_ptr: TIntegerField;
    ado208GON_PTR: TIntegerField;
    ado207Con_QTY: TBCDField;
    ado207QUAN_ASSIGN: TBCDField;
    ado207rkey475_w492: TIntegerField;
    procedure Edit1Change(Sender: TObject);
    procedure dtpk1CloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
   v_colwidth1,v_colwidth2: array of integer;
   dbgrid2_coltotal:integer;    
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure update_268(number:string);
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses damo,  return_invtstock, putourinvt_report,
 putoutmiscreport,common;

{$R *.dfm}

procedure TForm5.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm5.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  aq457.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  aq457.Filter:='';
end;

procedure TForm5.dtpk1CloseUp(Sender: TObject);
begin
 aq457.Close;
 aq457.Parameters[0].Value := dtpk1.Date;
 aq457.Parameters[1].Value := dtpk2.Date+1;
 aq457.Open;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 field_name:='GON_NUMBER';
 dbgrid2_coltotal:=dbgrid1.Width;
end;

procedure TForm5.FormShow(Sender: TObject);
var
i:byte;
begin
 dtpk2.Date:=common.getsystem_date(dm.ADOQuery1,1);
 dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;
 dtpk1CloseUp(sender);
 ado207.Open;
 ado208.Open;
// setlength(v_colwidth,dbgrid1.FieldCount);
 setlength(v_colwidth1,dbgrid2.FieldCount);
 setlength(v_colwidth2,dbgrid3.FieldCount);
// for i:=0 to high(v_colwidth) do v_colwidth[i] := dbgrid1.Columns[i].Width;
 for i:=0 to high(v_colwidth1) do v_colwidth1[i] := dbgrid2.Columns[i].Width;
 for i:=0 to high(v_colwidth2) do v_colwidth2[i] := dbgrid3.Columns[i].Width;
end;

procedure TForm5.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if (self.aq457TTYPE.Value=5) or (aq457TTYPE.Value=6) then
 begin
  dbgrid3.BringToFront;
 end
else
 begin
  dbgrid2.BringToFront;
 end;
end;

procedure TForm5.FormResize(Sender: TObject);
var
 i:byte;
begin
{for i:=low(v_colwidth) to high(v_colwidth) do
 dbgrid1.Columns[i].Width:=v_colwidth[i]+
  round((dbgrid1.Width-dbgrid2_coltotal)*v_colwidth[i]/(dbgrid2_coltotal-28));
}
for i:=low(v_colwidth1) to high(v_colwidth1) do
 dbgrid2.Columns[i].Width:=v_colwidth1[i]+
  round((dbgrid2.Width-dbgrid2_coltotal)*v_colwidth1[i]/(dbgrid2_coltotal-28));
for i:=low(v_colwidth2) to high(v_colwidth2) do
 dbgrid3.Columns[i].Width:=v_colwidth2[i]+
  round((dbgrid3.Width-dbgrid2_coltotal)*v_colwidth2[i]/(dbgrid2_coltotal-28));
end;


procedure TForm5.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(aq457.CommandText);
end;

procedure TForm5.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin

if (Aq457.IndexFieldNames<>column.FieldName)  then
   Aq457.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;  
 end
else
 edit1.SetFocus;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
var
 v_rkey457: integer;
begin
v_rkey457 := 0;
if not aq457.IsEmpty then  v_rkey457 := aq457rkey.Value;
 aq457.Close;
 aq457.Open;
if v_rkey457 > 0 then  aq457.Locate('rkey',v_rkey457,[]);
end;

procedure TForm5.PopupMenu1Popup(Sender: TObject);
begin
if self.aq457.IsEmpty then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

//全部退
procedure TForm5.N1Click(Sender: TObject);
 var
   v_date:TDateTime;
   rtn_qty: Double;
   number:string;   
begin
  if dm.find_phycount(number) then
  begin
    messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:'+number,
    mtinformation,[mbcancel],0);
    exit;
  end;
  
  if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
     messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else if messagedlg('全部退回货仓您确定?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    try
      dm.ADOConnection1.BeginTrans;
      v_date:=common.getsystem_date(DM.ADOQuery1,0);
      if (self.aq457TTYPE.Value=5) or (aq457TTYPE.Value=6) then
      begin                             //非生物料物
        self.ado208.Close;
        self.ado208.Open;
        self.ado208.First;
        while not self.ado208.Eof do
        begin
         if  ado208QUANTITY.Value-ado208RTN_QUANTITY.Value>0 then
         begin
          self.ado208.Edit;
          rtn_qty:=ado208QUANTITY.Value-ado208RTN_QUANTITY.Value;  //本次退货数量
          self.ado208QUAN_ON_HAND.Value:=ado208QUAN_ON_HAND.Value+  //235
                                    rtn_qty;
          self.ado208RTN_QUANTITY.Value:= self.ado208QUANTITY.Value;  //208
          self.ado208.Post;

          dm.ado208.close;
          dm.ado208.Open;
          dm.ado208.AppendRecord([ado208SOURCE_PTR.Value,  //235.rkey
                                  ado208DEPT_PTR.Value,      //部门
                                  ado208GON_PTR.Value,       // 457.rkey
                                  v_date,                //日期 长格式
                                  -rtn_qty,                 //数量
                                  ado208rkey
                                 ]);
         end;
          self.ado208.Next;
        end;
        ado208.Close;
        ado208.Open;
        dm.ado208.close;
      end
      else              //生产料物
      begin
        ado207.Close;
        ado207.Open;
        ado207.First;

        dm.ado95.close;
        dm.ado95.Open;

        dm.ado207.close;
        dm.ado207.Open;

        with dm.ADOQuery1 do
        begin
          close;
          sql.Text:='update data0017'+#13+
          'set Data0017.QUAN_ON_HAND=Data0017.QUAN_ON_HAND+d1.total_QUANTITY'+#13+
          'from data0017 inner join'+#13+
          '(select INVENTORY_PTR,sum(QUANTITY-RTN_QUANTITY) as total_QUANTITY'+#13+
          'from data0207' +#13+
          'where data0207.gon_ptr='+aq457rkey.AsString +#13+
          'and QUANTITY-RTN_QUANTITY>0' +#13+
          'group by INVENTORY_PTR ) as d1 on' +#13+
          'data0017.rkey=d1.INVENTORY_PTR';
          execsql;
        end;

        with dm.ADOQuery1 do
        begin
          close;
          sql.Text:='update Data0022'+#13+
            'set data0022.quan_on_hand=data0022.quan_on_hand+d1.qty'+#13+
            'FROM dbo.Data0022 INNER JOIN'+#13+
            '(SELECT data0207.D0022_PTR, SUM(QUANTITY-RTN_QUANTITY) AS qty'+#13+
            'FROM dbo.Data0207'+#13+
             'WHERE data0207.GON_PTR = '+aq457rkey.AsString+#13+
            'and QUANTITY-RTN_QUANTITY>0'+#13+       //多人同时操作时不会受影响
            'GROUP BY data0207.D0022_PTR) d1 ON'+#13+
            'dbo.Data0022.RKEY = d1.D0022_PTR';
          execsql;
        end;

        if (aq457TTYPE.Value=1) or (aq457TTYPE.Value=3) then   //配料单或领料单发放
        begin
         with dm.ADOQuery1 do
         begin
          close;
          sql.Text:='update Data0468'+#13+
            'set data0468.quan_issued=data0468.quan_issued-d1.qty,'+#13+
            'status=0'+#13+
            'FROM Data0468 INNER JOIN'+#13+
            '(SELECT data0207.D0468_PTR, SUM(QUANTITY-RTN_QUANTITY) AS qty'+#13+
            'FROM dbo.Data0207'+#13+
            'WHERE data0207.GON_PTR = '+aq457rkey.AsString+#13+
            'and QUANTITY-RTN_QUANTITY>0'+#13+
            'GROUP BY data0207.D0468_PTR) d1 ON'+#13+
            'Data0468.RKEY = d1.D0468_PTR';
          execsql;     //修改468库已发放数量
         end;
         self.update_268(trim(aq457REF_NUMBER.Value));

        end;
        while not ado207.Eof do
        begin
          if ado207QUANTITY.Value-ado207RTN_QUANTITY.Value>0 then
          begin
          
             //更新w492:
             if (aq457TTYPE.Value=1) or (aq457TTYPE.Value=3) then
             begin
               if not  ado207Con_QTY.IsNull then
               begin
               ado207.Edit;
               ado207Con_QTY.Value:=ado207Con_QTY.Value-  //492已发放
                       (ado207QUANTITY.value- ado207RTN_QUANTITY.value);
               ado207.Post;
               end;
             end;


            ado207.Edit;
            //数据不能建立唯一索引,程序存在问题需要改善061111
            dm.ado95.AppendRecord([16,                                          //类型
                              ado207INVENTORY_PTR.Value,                        //17.rkey
                              ado207D0022_PTR.value,                            //22.rkey
                              strtoint(user_ptr),                               //人员
                              v_date,            //日期 长格式
                              (ado207QUANTITY.Value-ado207RTN_QUANTITY.Value)]);//数量

            dm.ado207.AppendRecord([ado207INVENTORY_PTR.Value,                  //材料17.rkey
                              aq457rkey.Value,                                  //457.rkey
                              ado207D0022_PTR.Value,                            // 22.rkey
                              ado207RTN_QUANTITY.Value-ado207QUANTITY.Value,    //数量
                              aq457dept_ptr.Value,                              //部门
                              v_date,            //日期 长格式
                              4,                                                //类型
                              ado207STANDARD_COST.value,
                              ado207D0468_PTR.AsVariant]);                      //标准成本

            ado207RTN_QUANTITY.Value:=ado207QUANTITY.Value;


                // ShowMessage(aq457TTYPE.asstring+'_'+ado207QUANTITY.asstring+'-' +ado207RTN_QUANTITY.asstring);




            self.ado207.Post;
          end;
          self.ado207.Next;
        end;
       self.ado207.Close;
       self.ado207.Open;
      end;

      dm.ADOConnection1.CommitTrans;
      messagedlg('全部退仓操作成功!', mtinformation,[mbok],0);

    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TForm5.update_268(number: string);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='update data0268'+#13+
    'set status=2'+#13+
    'where status=4'+#13+
    'and DATA0268.number='+quotedstr(number);
  ExecSQL;
 end;
end;

//生产料单项退
procedure TForm5.N2Click(Sender: TObject);
var
 rkey207:integer;
 number:string;
begin
  if dm.find_phycount(number) then
  begin
    messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:'+number,
    mtinformation,[mbcancel],0);
    exit;
  end;
  
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
BEGIN
 rkey207:=self.ado207rkey.Value;
 self.ado207.Close;
 self.ado207.Open;
 if ado207.Locate('rkey',rkey207,[]) then
 begin
  Form_returninvt:=TForm_returninvt.Create(application);
  Form_returninvt.Edit1.Text:=self.ado207QUANTITY.AsString;
  Form_returninvt.Edit2.Text:=self.ado207UNIT_NAME.Value;
  Form_returninvt.Edit3.Text:=formatfloat('0.000',self.ado207QUANTITY.Value-
                                                  self.ado207RTN_QUANTITY.Value);
  Form_returninvt.Edit4.Text:=Form_returninvt.Edit3.Text;

  if Form_returninvt.ShowModal=mrok then
   begin
   dm.ADOConnection1.BeginTrans;
   try
   dm.ado95.close;
   dm.ado95.Open;
   dm.ado207.close;
   dm.ado207.Open;
   ado207.Edit;
   ado207QUAN_ON_HAND.Value:=ado207QUAN_ON_HAND.Value+   //修改22增加当前库存
                            strtocurr(Form_returninvt.Edit4.Text);
   ado207hand17.Value:=ado207hand17.Value+
                        strtocurr(Form_returninvt.Edit4.Text); //库存17中的退货的数量
   if (aq457TTYPE.Value=1) or (aq457TTYPE.Value=3) then
   begin
     ado207QUAN_ISSUED.Value:=ado207QUAN_ISSUED.Value-  //468配料单中已发放数量
                       strtocurr(Form_returninvt.Edit4.Text);
     ado207STATUS.Value:=0;        //468中的发放状态
     self.update_268(trim( self.aq457REF_NUMBER.Value));


     //更新192：
   if  not  ado207Con_QTY.IsNull then 
    ado207Con_QTY.Value:=ado207Con_QTY.Value-strtocurr(Form_returninvt.Edit4.Text);  //492已发放

 
   end;
   dm.ado95.AppendRecord([16,               //类型
                         ado207INVENTORY_PTR.Value,        //17.rkey
                         ado207D0022_PTR.value,            //22.rkey
                         strtoint(user_ptr), //人员
                         common.getsystem_date(dm.ADOQuery1,0),  //日期 长格式
                         strtocurr(Form_returninvt.Edit4.Text)]);//退货数量

   dm.ado207.AppendRecord([ado207INVENTORY_PTR.Value,    //材料17.rkey
                          aq457rkey.Value,            //457.rkey
                          ado207D0022_PTR.Value,    // 22.rkey
                          -strtocurr(Form_returninvt.Edit4.Text),   //数量
                          aq457dept_ptr.Value,        //部门
                          common.getsystem_date(dm.ADOQuery1,0),   //日期 长格式
                          4,                              //类型
                          ado207STANDARD_COST.value,
                          ado207D0468_PTR.AsVariant]); //标准成本

   ado207RTN_QUANTITY.Value:=ado207RTN_QUANTITY.Value+strtocurr(Form_returninvt.Edit4.Text);  //207
   ado207.Post;
   dm.ADOConnection1.CommitTrans;
   messagedlg('退仓操作成功!', mtinformation,[mbok],0);
   ado207.Close;
   ado207.Open;
   except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end;
   end;
  Form_returninvt.Free;
 end;
END; 
end;

procedure TForm5.N3Click(Sender: TObject);
var
 rkey208:integer;
 v_date:TDateTime;
 number:string;
begin
  if dm.find_phycount(number) then
  begin
    messagedlg('仓库正在进行材料盘点暂时不能操作该程序,盘点代码及人员:'+number,
    mtinformation,[mbcancel],0);
    exit;
  end;
  
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
BEGIN
 rkey208:=self.ado208rkey.Value;
 self.ado208.Close;
 self.ado208.Open;
 if ado208.Locate('rkey',rkey208,[]) then
 begin
  Form_returninvt:=TForm_returninvt.Create(application);
  Form_returninvt.Edit1.Text:=self.ado208QUANTITY.AsString;
  Form_returninvt.Edit2.Text:=self.ado208UNIT_NAME.Value;
  Form_returninvt.Edit3.Text:=formatfloat('0.000',self.ado208QUANTITY.Value-
                                                  self.ado208RTN_QUANTITY.Value);
  Form_returninvt.Edit4.Text:=Form_returninvt.Edit3.Text;

  if Form_returninvt.ShowModal=mrok then
   begin
   try
    dm.ADOConnection1.BeginTrans;
    v_date:=common.getsystem_date(dm.ADOQuery1,0);
    ado208.Edit;
    ado208QUAN_ON_HAND.Value:=ado208QUAN_ON_HAND.Value+   //修改235增加当前库存
                            strtocurr(Form_returninvt.Edit4.Text);
    ado208RTN_QUANTITY.Value:=ado208RTN_QUANTITY.Value+strtocurr(Form_returninvt.Edit4.Text);  //208退货数量
    ado208.Post;

    dm.ado208.close;
    dm.ado208.Open;
    dm.ado208.AppendRecord([ado208SOURCE_PTR.Value,  //235.rkey
                            ado208DEPT_PTR.Value,      //部门
                            ado208GON_PTR.Value,          // 457.rkey
                            v_date,   //日期 长格式
                            -strtocurr(Form_returninvt.Edit4.Text),  //数量
                            ado208rkey
                           ]);

   dm.ADOConnection1.CommitTrans;
   ado208.close;
   ado208.open;
   dm.ado208.close;
   messagedlg('退仓操作成功!', mtinformation,[mbok],0);
   except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end;
   end;
  Form_returninvt.Free;
 end;
END; 
end;

procedure TForm5.N4Click(Sender: TObject);
begin
if (self.aq457TTYPE.Value=5) or (aq457TTYPE.Value=6) then
begin
 Form_putoutmiscreport:=TForm_putoutmiscreport.Create(application);
 Form_putoutmiscreport.aq457.Close;
 Form_putoutmiscreport.aq457.Parameters[0].Value:=self.aq457RKEY.Value;
 Form_putoutmiscreport.aq457.Open;
 Form_putoutmiscreport.ado208.Open;
 Form_putoutmiscreport.ppReport1.Reset;
 Form_putoutmiscreport.ppReport1.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_miscreport.rtm';
 Form_putoutmiscreport.ppReport1.Template.LoadFromFile;
 Form_putoutmiscreport.ppReport1.SaveAsTemplate:=False;
 Form_putoutmiscreport.ppReport1.Print;
 Form_putoutmiscreport.Free;
end
else
 begin
  Form_putoutintreport:=TForm_putoutintreport.Create(application);
  Form_putoutintreport.aq457.Close;
  Form_putoutintreport.aq457.Parameters[0].Value:=self.aq457RKEY.Value;
  Form_putoutintreport.aq457.Open;
  Form_putoutintreport.ADO207.Open;
  Form_putoutintreport.ppReport1.Reset;
  Form_putoutintreport.ppReport1.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_invtreport.rtm';
  Form_putoutintreport.ppReport1.Template.LoadFromFile;
  Form_putoutintreport.ppReport1.SaveAsTemplate:=False;
  Form_putoutintreport.ppReport1.Print;
  Form_putoutintreport.Free;
 end;
end;

procedure TForm5.PopupMenu2Popup(Sender: TObject);
begin
if self.ado207QUANTITY.Value>self.ado207RTN_QUANTITY.Value then
 n2.Enabled:=true
else
 n2.Enabled:=false;
end;

procedure TForm5.PopupMenu3Popup(Sender: TObject);
begin
if self.ado208QUANTITY.Value>self.ado208RTN_QUANTITY.Value then
 n3.Enabled:=true
else
 n3.Enabled:=false;
end;

procedure TForm5.N5Click(Sender: TObject);
begin
{  Form9:=TForm9.Create(Application);
  try
    Form9.ppReport1.Reset;
    Form9.ppReport1.Template.LoadFromFile;
    Form9.ppReport1.SaveAsTemplate:=True;
    Form9.ppDesigner1.showmodal;
  finally
    Form9.Free;
  end;
 }

  Form_putoutintreport:=TForm_putoutintreport.Create(application);
  Form_putoutintreport.ppReport1.Reset;
  Form_putoutintreport.ppReport1.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_invtreport.rtm';
  Form_putoutintreport.ppReport1.Template.LoadFromFile;
  Form_putoutintreport.ppReport1.SaveAsTemplate:=True;

  Form_putoutintreport.ppDesigner1.ShowModal;
  Form_putoutintreport.Free;

end;

procedure TForm5.N6Click(Sender: TObject);
begin
{  Form10:=TForm10.Create(Application);
  try
    Form10.ppReport1.Reset;
    Form10.ppReport1.Template.LoadFromFile;
    Form10.ppReport1.SaveAsTemplate:=True;
    Form10.ppDesigner1.showmodal;
  finally
    Form10.Free;
  end;
 }
 Form_putoutmiscreport:=TForm_putoutmiscreport.Create(application);

 Form_putoutmiscreport.ppReport1.Reset;
 Form_putoutmiscreport.ppReport1.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_miscreport.rtm';
 Form_putoutmiscreport.ppReport1.Template.LoadFromFile;
 Form_putoutmiscreport.ppReport1.SaveAsTemplate:=True;

 Form_putoutmiscreport.ppDesigner1.ShowModal;
 Form_putoutmiscreport.Free;
  
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  PopupMenu4.Popup(mouse.Cursorpos.X,mouse.Cursorpos.Y);
end;

end.
