unit route_flow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls, DB;

type
  TForm_route = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    DBComboBox1: TDBComboBox;
    Label2: TLabel;
    route_ptr: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure get_value(rkey278:integer);
   function vertify2(vstring:string):string;
   function vertify3(vstring:string):string;
   function calTooling(vstr:string):string;
   function judge_condition(rkey:integer;formula:string):boolean;
   procedure get_parentptr(var rkey505: integer; var par_formula :string);
   function cacl_flowpara(tvalue,par_formula :string;rkey278:integer):string;
   function calaflowpara(vstr:string):string;
  public
    { Public declarations }
  end;
type
 TMyDBGrid=class(TDBGrid);

var
  Form_route: TForm_route;

implementation

uses damo, iesmodel_search;

{$R *.dfm}
function TForm_route.vertify3(vstring:string):string;
var
  i,j,j0,j1:integer;
begin
 vstring:=' '+vstring+' ';

while POS('IF(',vstring) > 0 do
 begin
  i:=POS('IF(',vstring);
  j:=POS(',',vstring);
  j0:=POS(',',copy(vstring,j+1,length(vstring)-j));
  j1:=POS(')',copy(vstring,j+j0+1,length(vstring)-j-j0));

  try    //检验IF（条件，返回值1，返回值2）函数的条件表达式是否合法
   with dm.ADOQuery4 do
    begin
     close;
     sql.clear;
     sql.add('select 1 as true_or_false where '+copy(vstring,i+3,j-i-3));
     open;
    end;
  except
   showmessage('工式设定条件不准确'+dm.ADS38STEP_NUMBER.AsString);
   exit;
  end;

  if not dm.ADOQuery4.IsEmpty then   //不为空代表条件成立,取返回值1
   try    //检验IF（条件，返回值1，返回值2）函数的返回值1是否有效
     with dm.ADOQuery4 do
      begin
       close;
       sql.clear;
       sql.add('SELECT 1.000000*('+copy(vstring,j+1,j0-1)+') as vqty ');
       open;
      end;
   except
    showmessage('工式设定函数的返回值1不准确'+dm.ADS38STEP_NUMBER.AsString);
    exit;
   end
  else    // 条件不成立取返回值2
   try    //检验IF（条件，返回值1，返回值2）函数的返回值2是否有效
    with dm.ADOQuery4 do
     begin
      close;
      sql.clear;
      sql.add('SELECT 1.000000*('+copy(vstring,j+j0+1,j1-1)+') as vqty ');
      open;
     end;
   except
    showmessage('工式设定函数的返回值2不准确'+dm.ADS38STEP_NUMBER.AsString);
    exit;
   end;

   vstring:=copy(vstring,1,i-1)+dm.ADOQuery4.fieldbyname('vqty').asstring+
            copy(vstring,j+j0+j1+1,length(vstring)-j-j0-j1);
 end;

 result:='SELECT '+vstring+' as tvalue';
end;

function TForm_route.calaflowpara(vstr:string):string;
var
  j:integer;
  vstring,vstring1,vstring2:string;
begin
 vstring:=' '+vstr+' ';

 while pos(' PROJECT ',vstring)>0 do//如果产品型号被引用多次
  begin
   j:=pos(' PROJECT ',vstring);
   vstring1:=copy(vstring,1,j-1);
   vstring2:=copy(vstring,j+2+length(trim(' PROJECT ')),500-j-length(trim(' PROJECT ')));
   vstring:=vstring1+' '''+label3.Caption+''''+vstring2;
  end;

 dm.ADS279.DisableControls;
 dm.ads279.First ;
 while not dm.ads279.eof do
  begin
   while pos(' '+trim(dm.ads279PARAMETER_NAME.Value)+' ',vstring)>0 do //如果一个参数出现了多次就通过这个循环逐一代换
    begin
      j:=pos(' '+trim(dm.ads279PARAMETER_NAME.Value)+' ',vstring);
      vstring1:=copy(vstring,1,j-1);
      vstring2:=copy(vstring,j+2+length(trim(dm.ads279PARAMETER_NAME.Value)),
                           500-j-length(trim(dm.ads279PARAMETER_NAME.Value)));
      IF dm.ads279datatype.value='数字' then    //代表数值型变量
       if pos('.',trim(dm.ads279PARAMETER_VALUE.Value))>0 then
        vstring:=vstring1+' '+trim(dm.ads279PARAMETER_VALUE.Value)+' '+vstring2
       else
        vstring:=vstring1+' '+trim(dm.ads279PARAMETER_VALUE.Value)+'.0000000'+' '+vstring2
      else     //字符型
       vstring:=vstring1+' '''+trim(dm.ads279PARAMETER_VALUE.Value)+''' '+vstring2;
    end;
   dm.ads279.Next;
  end;
  dm.ADS279.EnableControls;

  if POS('IF(',vstring) > 0 then
   result := vertify3(vstring)
  else
   result := 'SELECT '+vstring+' as tvalue';
end;

function TForm_route.cacl_flowpara(tvalue, par_formula: string;
  rkey278: integer): string;
begin
 result:=tvalue;

 if dm.ADS279_0.Locate('PARAMETER_PTR',rkey278,[]) then
  result:=dm.ads279_0PARAMETER_VALUE.Value;

if par_formula<>'' then
try
 dm.ADOQuery3.Close;
 dm.ADOQuery3.SQL.Text:=self.calaflowpara(par_formula);
 dm.ADOQuery3.Open;

if not dm.ADOQuery3.IsEmpty then
 result:=dm.ADOQuery3.fieldbyname('tvalue').AsString;
except

end

end;

procedure TForm_route.NewGridWnd(var Message: TMessage);
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

procedure  TForm_route.get_value(rkey278:integer);
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select tvalue from data0338 where parameter_ptr='+inttostr(rkey278));
    open;
   end;
  if not dm.adoquery1.IsEmpty then
   begin
    DBComboBox1.Items.Clear;
    while not dm.adoquery1.eof do
     begin
      DBComboBox1.Items.Add(trim(dm.adoquery1.FieldValues['tvalue']));
      dm.adoquery1.Next;
     end;
   end
  else
   DBComboBox1.Items.Clear;
end;

procedure TForm_route.get_parentptr(var rkey505: integer; var par_formula: string);
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select parent,formula from data0505 where rkey='+inttostr(rkey505);
  open;
  if not isempty then
  begin
   rkey505:=fieldbyname('parent').AsInteger;
   par_formula:=fieldbyname('formula').AsString;
  end
  else
   begin
    rkey505:=0;
    par_formula:='';
   end;
 end;
end;

function TForm_route.vertify2(vstring:string):string;
var
  i,j,j0,j1:integer;
begin
 vstring:=' '+vstring+' ';
while POS('IF(',vstring)>0 do
 begin
  i:=POS('IF(',vstring);
  j:=POS(',',vstring);
  j0:=POS(',',copy(vstring,j+1,length(vstring)-j));
  j1:=POS(')',copy(vstring,j+j0+1,length(vstring)-j-j0));
  try    //检验IF（条件，返回值1，返回值2）函数的条件表达式是否合法
   with dm.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select 1 as true_or_false where '+copy(vstring,i+3,j-i-3));
      open;
    end;
  except
    exit;
  end;

  if not dm.ADOQuery1.IsEmpty then
   begin
    try    //检验IF（条件，返回值1，返回值2）函数的返回值1是否有效
      with dm.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('SELECT 1.000000*('+copy(vstring,j+1,j0-1)+') as vqty ');
        open;
      end;
    except
      exit;
    end;
   end
  else
   begin
    try    //检验IF（条件，返回值1，返回值2）函数的返回值2是否有效
      with dm.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('SELECT 1.000000*('+copy(vstring,j+j0+1,j1-1)+') as vqty ');
        open;
      end;
    except
      exit;
    end;
   end;

   vstring:=copy(vstring,1,i-1)+dm.ADOQuery1.fieldbyname('vqty').asstring+
            copy(vstring,j+j0+j1+1,length(vstring)-j-j0-j1);
 end;
  result:='SELECT 1 as true_or_false where '+vstring;
end;

function TForm_route.calTooling(vstr:string):string;
var
  j,j0,j1,j2:integer;
  vstring,vstring1,vstring2:string;
  vcol,vrow,vptr:string;
  vresult:string;
begin
  vstring:=' '+vstr+' ';
  dm.ADS279_0.DisableControls;
  dm.ads279_0.First ;
 while not dm.ads279_0.eof do
  begin
   while pos(' '+trim(dm.ads279_0PARAMETER_NAME.Value)+' ',vstring)>0 do //如果一个参数出现了多次就通过这个循环逐一代换
    begin
      j:=pos(' '+trim(dm.ads279_0PARAMETER_NAME.Value)+' ',vstring);
      vstring1:=copy(vstring,1,j-1);
      vstring2:=copy(vstring,j+2+length(trim(dm.ads279_0PARAMETER_NAME.Value)),
                           500-j-length(trim(dm.ads279_0PARAMETER_NAME.Value)));
      IF dm.ads279_0datatype.value='数字' then    //代表数值型变量
       if pos('.',trim(dm.ads279_0PARAMETER_VALUE.Value))>0 then
        vstring:=vstring1+' '+trim(dm.ads279_0PARAMETER_VALUE.Value)+' '+vstring2
       else
        vstring:=vstring1+' '+trim(dm.ads279_0PARAMETER_VALUE.Value)+'.0000000'+' '+vstring2
      else     //字符型
       vstring:=vstring1+' '''+trim(dm.ads279_0PARAMETER_VALUE.Value)+''' '+vstring2;
    end;
   dm.ads279_0.Next;
  end;
  dm.ADS279_0.EnableControls;

  if dm.aq280.Active =false then dm.aq280.Open ;  //工程表单
  dm.aq280.first;
  while not dm.AQ280.Eof do
   begin
    while pos(trim(dm.AQ280ENG_TABLE_NAME.Value)+'(',vstring)>0 do
     begin //如果一个参数出现了多次就通过这个循环逐一代换
      j:=pos(trim(dm.AQ280ENG_TABLE_NAME.Value)+'(',vstring);
      j0:=pos('(',copy(vstring,j,length(vstring)-j));
      j1:=pos(',',copy(vstring,j,length(vstring)-j));
      j2:=pos(')',copy(vstring,j,length(vstring)-j));
      vstring1:=copy(vstring,1,j-1);
      vstring2:=copy(vstring,j+j2,500-j-j2);

      vptr:=DM.AQ280RKEY.AsString;
      vrow:=copy(vstring,j+j0,j1-j0-1); //函数X变量
      vcol:=copy(vstring,j+j1,j2-j1-1); //函数Y变量

      with dm.ADOStoredProc1 do //读取所在的行号
       begin
        close;
        parameters.ParamByName('@vptr').Value :=strtoint(vptr); //280.RKEY
        parameters.ParamByName('@vtpx').Value :=DM.AQ280fx_type.Value; //x方向变量类型
        parameters.ParamByName('@vtpy').Value :=DM.AQ280fy_type.Value; //Y方向变量类型
        if dm.AQ280fx_type.Value=1 then //数字类型
         begin
          parameters.ParamByName('@vcol').Value :=strtofloat(vrow);
          parameters.ParamByName('@vcol0').Value :='';
         end
        else
         begin
          parameters.ParamByName('@vcol').Value := 0;
          parameters.ParamByName('@vcol0').Value := trim(vrow);
         end;
        if dm.AQ280fy_type.Value=1 then //数字类型
         begin
          parameters.ParamByName('@vrow').Value :=strtofloat(vcol);
          parameters.ParamByName('@vrow0').Value :='';
         end
        else
         begin
          parameters.ParamByName('@vrow').Value := 0;
          parameters.ParamByName('@vrow0').Value := trim(vcol);
         end;
        prepared;
        open;
        vresult:=trim(dm.ADOStoredProc1tvalue.Value);
       end;
      if dm.AQ280DATA_TYPE.Value=1 then
       if pos('.',vresult)>0 then
         vstring:=vstring1+vresult+vstring2
       else
         vstring:=vstring1+' '+vresult+'.000000'+' '+vstring2
      else
        vstring:=vstring1+' '''+vresult+''' '+vstring2;
     end;
   dm.AQ280.Next;
  end;
  dm.AQ280.Close;
  dm.ADOStoredProc1.Close;

  if POS('IF(',vstring)>0 then
   result:=vertify2(vstring)
  else
   result:='SELECT 1 as true_or_false where '+vstring;
end;

function TForm_route.judge_condition(rkey: integer;
  formula: string): boolean;
var
 parent_ptr:integer;
 parent_formula:string;
begin
if rkey=0 then       //本身就是一级工序无站占
 begin
  if trim(formula)='' then
   result:=true
  else
   begin
    try
    dm.adoquery3.close;
    dm.ADOQuery3.SQL.Text:=self.calTooling(formula);
    dm.ADOQuery3.Open;
    if not dm.ADOQuery3.IsEmpty then   //计算返回的结果为真
     result:=true
    else
     result:=false;
    except
     result:=false;
    end;
   end;
 end
else       //有父站占
 begin
  if trim(formula)='' then
   begin
    parent_ptr:=rkey;
    parent_formula:='';
    get_parentptr(parent_ptr,parent_formula);  //得到父新的值及计算公式
    if judge_condition(parent_ptr,parent_formula) then //函数递归调用自己
     result:=true
    else
     result:=false;
   end
  else
   begin
    try
    dm.adoquery3.close;
    dm.ADOQuery3.SQL.Text:=self.calTooling(formula);
    dm.ADOQuery3.Open;
    if not dm.ADOQuery3.IsEmpty then   //计算返回的结果为真
     begin
      parent_ptr:=rkey;
      parent_formula:='';
      get_parentptr(parent_ptr,parent_formula); //得到父新的值及计算公式
      if judge_condition(parent_ptr,parent_formula) then //函数递归调用自己
       result:=true
      else
       result:=false;
     end
    else
     result:=false;
    except
     result:=false;
    end;
   end;
 end;
end;


procedure TForm_route.BitBtn1Click(Sender: TObject);
var
 step_number:word;
 modalok:boolean;
 rev:string;
begin
if strtoint(route_ptr.Caption)<=0 then
 messagedlg('请首先选择流程模型编号!',mterror,[mbcancel],0)
else
begin
if not dm.ADS38.IsEmpty then
 begin
  if messagedlg('产品已经有流程数据重新生成流程将有可能导致原流程及制程信息丢失,请确认?',
    mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   dm.ADS38.First;
   while not dm.ADS38.Eof do dm.ADS38.Delete;
   dm.ads494.Filter:='';
   dm.ads494.First;
   while not dm.ads494.Eof do dm.ads494.Delete;
   modalok:=true;
  end
  else
   modalok:=false;
 end
else
 modalok:=true;
if modalok then
 begin
  step_number:=1;
  with dm.ADOQuery2 do
   begin
    close;
    sql.Text:='SELECT data0505.DEPT_PTR, data0505.PARENT, data0505.Formula,'+#13+
      'data0034.DEF_ROUT_INST,data0034.ppc_status'+#13+
      'FROM Data0505 inner join data0034'+#13+
      'on data0505.dept_ptr=data0034.rkey'+#13+
      'WHERE data0505.TTYPE = 1 and'+#13+
      'data0505.Eng_Flow_ptr = '+route_ptr.Caption+#13+
      'ORDER BY Step';
    open;
    while not Eof do //函数中千万不能使用adoquery2
    begin
     if judge_condition(fieldbyname('PARENT').AsInteger, //使用了query3,query1
                        trim(fieldbyname('Formula').AsString)) then
     begin
      if fieldbyname('ppc_status').AsInteger=0 then
       rev:=''
      else
       rev:=self.Label4.Caption; 
      dm.ADS38.AppendRecord([dm.AQY0025RKEY.Value,
                            fieldvalues['dept_ptr'],
                            fieldvalues['DEF_ROUT_INST'],
                            step_number,rev,1]);

      dm.ADOQuery1.Close;   //=====不能改变adoquery1的语句
      dm.ADOQuery1.SQL.Text:=
'SELECT TOP 100 PERCENT PARAMETER_PTR, TValue, Doc_Flag, after_flag, formula,'+#13+
      'flow_spfc_flag, SEQ_NO'+#13+
      'FROM dbo.Data0506'+#13+
      'WHERE TTYPE = 3 AND '+#13+
      'SOURCE_PTR = '+dm.ADS38DEPT_PTR.AsString+#13+
      'ORDER BY SEQ_NO';
      dm.ADOQuery1.Open;
      dm.ADS279_0.DisableControls;
      while not dm.ADOQuery1.Eof do
      begin
       dm.ads494.AppendRecord([dm.ADOQuery1.FieldValues['PARAMETER_PTR'],
                    cacl_flowpara(dm.ADOQuery1.Fieldbyname('TValue').AsString,
                             trim(dm.ADOQuery1.Fieldbyname('formula').AsString),
                                  dm.ADOQuery1.FieldValues['PARAMETER_PTR']),
                               dm.AQY0025RKEY.Value,
                               dm.ADS38STEP_NUMBER.Value,
                               dm.ADOQuery1.FieldValues['SEQ_NO'],
                               dm.ADOQuery1.FieldValues['Doc_Flag'],
                               dm.ADOQuery1.FieldValues['after_flag'],
                               dm.ADOQuery1.FieldValues['flow_spfc_flag']]);
       dm.ADOQuery1.Next;
      end;          //=======不能改变adoquery1的语句
      dm.ADS279_0.EnableControls;
      inc(step_number);
     end;
     Next;
    end;    //=======不能改变adoquery2的语句

   end;
  dm.ADS38.First;
  dm.ads494.First;
  self.ModalResult:=mrok;
 end;
end;
end;

procedure TForm_route.DBGrid1CellClick(Column: TColumn);
begin
if column.Index<4 then dbgrid1.SelectedIndex:=4;
end;

procedure TForm_route.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if (gdFocused in State) then
 begin
  if (column.FieldName = DBComboBox1.DataField ) then
   begin
    DBComboBox1.Left := Rect.Left+1;
    DBComboBox1.Top := Rect.Top+2;
    DBComboBox1.Width := Rect.Right - Rect.Left+3;
    DBComboBox1.Height := Rect.Bottom - Rect.Top;
    self.get_value(dm.ads279_0PARAMETER_PTR.Value);

    if dbcombobox1.Items.Count > 0 then
     DBComboBox1.Visible := True
    else
     DBComboBox1.Visible := false;
   end;
 end;
 with TMyDBGrid(Sender) do
 begin
  if DataLink.ActiveRecord=Row-1 then
   begin
    Canvas.Font.Color:=clWhite;
    Canvas.Brush.Color:=$00800040;
   end
  else
   begin
    Canvas.Brush.Color:=Color;
    Canvas.Font.Color:=Font.Color;
   end;
  DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;
end;

procedure TForm_route.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (dm.ADS279_0.RecNo=dm.ads279_0.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
 if (key=112) and
    (dbcombobox1.Visible) and
    (dbcombobox1.Enabled) then
  begin                         //F1键出现下拉
   dbcombobox1.SetFocus;
   dbcombobox1.DroppedDown:=true;
  end;
end;

procedure TForm_route.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if dm.ads279_0datatype.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;
  
if (key <> chr(9)) then
 begin
  if (DBGrid1.SelectedField.FieldName =DBComboBox1.DataField) and
     (dbcombobox1.Items.Count > 0) and
     (dbcombobox1.Enabled) then
   begin
    DBComboBox1.SetFocus;
    SendMessage(DBComboBox1.Handle,WM_Char,word(Key),0);
   end;
 end;
end;

procedure TForm_route.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then dbcombobox1.DroppedDown:=true; //F1键出现下拉
if key=13 then dbgrid1.SetFocus;
end;

procedure TForm_route.DBGrid1ColExit(Sender: TObject);
begin
If DBGrid1.SelectedField.FieldName = DBComboBox1.DataField then
 DBComboBox1.Visible := false;
end;

procedure TForm_route.BitBtn3Click(Sender: TObject);
begin
try
form_iesmodel:=tform_iesmodel.Create(application);
if Form_iesmodel.ShowModal=mrok then
begin
 if strtoint(route_ptr.Caption)<>form_iesmodel.ADOQuery1RKEY.Value then
 begin
  edit1.Text:=form_iesmodel.ADOQuery1ENG_FLOW_NAME.Value;
  label2.Caption:=form_iesmodel.ADOQuery1ENG_FLOW_DESC.Value;
  route_ptr.Caption:=form_iesmodel.ADOQuery1RKEY.AsString;
  dm.ads279_0.First;
  while not dm.ADS279_0.Eof do dm.ads279_0.Delete;

  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select PARAMETER_PTR FROM dbo.Data0506'+#13+
             'where ttype=1 and'+#13+
             'source_ptr='+form_iesmodel.ADOQuery1RKEY.AsString;
   open;
   while not eof do
   begin
    dm.ADS279_0.AppendRecord([dm.AQY0025RKEY.Value,
                              fieldvalues['PARAMETER_PTR'],
                              '',
                              0,       //代表流程判断参数1代表全局参数
                              RecNo]);
    next;
   end;
  end;
  
  dm.ADS279_0.First;
 end;
end;
finally
form_iesmodel.Free;
end;
end;

procedure TForm_route.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc ;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_route.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 if dm.ads279_0datatype.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm_route.SpeedButton1Click(Sender: TObject);
begin
 if not dm.ads89.Active then  dm.ads89.Open;  //打开评审信息(只有顶层有)
 dm.ads89.DisableControls;
 dm.ads279.DisableControls;
 dm.ADS279_0.DisableControls;

 dm.ADS279_0.First;
 while not dm.ads279_0.Eof do
 begin
  if dm.ads89.Locate('PARAMETER_NAME',dm.ads279_0PARAMETER_NAME.Value,[]) then
  begin
   dm.ADS279_0.Edit;
   dm.ads279_0PARAMETER_VALUE.Value:=dm.ads89tvalue.Value;
  end;

  if dm.ads279.Locate('PARAMETER_PTR',dm.ads279_0PARAMETER_PTR.Value,[]) then
  begin
   dm.ADS279_0.Edit;
   dm.ads279_0PARAMETER_VALUE.Value:=dm.ads279PARAMETER_VALUE.Value;
  end;

  dm.ads279_0.Next;
 end;

 dm.ads89.First;
 dm.ads279.First;
 dm.ADS279_0.First;
 dm.ads279.EnableControls;
 dm.ads89.EnableControls;
 dm.ADS279_0.EnableControls;
end;

procedure TForm_route.BitBtn4Click(Sender: TObject);
begin
dm.ADS279_0.CancelBatch();
end;

procedure TForm_route.FormActivate(Sender: TObject);
begin
if dm.AQY0025ENG_ROUTE_PTR.value>0 then
if dm.ADS279_0.IsEmpty then
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select PARAMETER_PTR FROM dbo.Data0506'+#13+
             'where ttype=1 and'+#13+
             'source_ptr='+dm.AQY0025ENG_ROUTE_PTR.AsString;
   open;
   while not eof do
   begin
    dm.ADS279_0.AppendRecord([dm.AQY0025RKEY.Value,
                              fieldvalues['PARAMETER_PTR'],
                              '',
                              0,       //代表流程判断参数1代表全局参数
                              RecNo]);
    next;
   end;
   dm.ADS279_0.First;
  end;
end;

end.
