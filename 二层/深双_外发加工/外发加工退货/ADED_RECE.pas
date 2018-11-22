unit ADED_RECE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls, StrUtils;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    StrGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Memo1: TMemo;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function received_over(rkey300:string):boolean;
    procedure StrGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StrGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Enter(Sender: TObject);
    function location_over():boolean;
    procedure StrGrid1Exit(Sender: TObject);
    procedure StrGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    epi_ptr,supp_ptr,dept_ptr:integer;
    procedure update_04(v_seed:string);
    function Power(x, y : extended) : extended;
    function SaveCheckPass():Boolean;
  public
    { Public declarations }
    aded_flag:byte;//1新增，2编辑，3检查, 4返工收货
  end;

var
  Form2: TForm2;


implementation

uses data_module, main, eip_search;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
  strgrid1.Cells[0,0]:='本厂编号';
  strgrid1.Cells[1,0]:='客户型号';
  strgrid1.Cells[2,0]:='规格';
  strgrid1.Cells[3,0]:='单位';
  if Self.aded_flag = 4 then
    strgrid1.Cells[4,0]:='已返工接收'
  else
    strgrid1.Cells[4,0]:='已外发收货';
  
  strgrid1.Cells[5,0]:='待返工';
  if self.aded_flag = 4 then
    StrGrid1.Cells[6,0]:='本次返工收货'
  else
    strgrid1.Cells[6,0]:='本次返工';
  strgrid1.Cells[7,0]:='备注';
  strgrid1.Cells[8,0]:='rkey304';
  StrGrid1.Cells[9,0]:='rkey25';
  strgrid1.ColWidths[8]:=0;
  StrGrid1.ColWidths[9]:=0;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
  i:word;
  rkey303:Integer;
begin
  if self.aded_flag=1 then //新增
  begin
    self.DateTimePicker1.Date:=form1.sys_shortdate;
    with dm.tmp do
    begin
      Close;
      SQL.Text:='SELECT SEED_VALUE '+
                'FROM Data0004 '+
                'WHERE table_name = ''WZDATA306''';
      Open;
      Edit1.Text:=dm.tmp.Fields[0].AsString;
      Close;
      SQL.Text:='SELECT EMPLOYEE_NAME '+
                'FROM Data0005 '+
                'WHERE RKEY = '+inttostr(Form1.empl_ptr);
      Open;
      Edit5.Text:=dm.tmp.Fields[0].AsString;
    end;
    form_episearch:=tform_episearch.Create(application);
    if form_episearch.ShowModal=mrok then
    begin
      with dm.tmp do
      begin
        Close;
        SQL.Text:='UPDATE WZDATA304 '+
                  'SET rework_qry = wzdata307sum.rework_qry_sum '+
                  'FROM WZDATA304 INNER JOIN '+
                  '     WZDATA301 ON WZDATA304.EPILIST_PTR = WZDATA301.RKEY INNER JOIN '+
                  '      (SELECT received_ptr, CUSTPART_PTR, SUM(rework_qry - received_qty) AS rework_qry_sum '+
                  '       FROM WZDATA307 '+
                  '       GROUP BY received_ptr, CUSTPART_PTR) AS wzdata307sum ON WZDATA301.CUSTPART_PTR = wzdata307sum.CUSTPART_PTR AND '+
                  '     WZDATA304.RKEY = wzdata307sum.received_ptr '+
                  'WHERE dbo.WZDATA304.DELIVER_PTR='+ Form_episearch.Aqwz303RKEY.AsString ;
        ExecSQL;
      end;
      rkey303 :=Form_episearch.Aqwz303RKEY.Value;
      Form_episearch.Aqwz303.Close;
      Form_episearch.Aqwz304.Close;
      Form_episearch.Aqwz303.Open;
      Form_episearch.Aqwz304.Open;
      Form_episearch.Aqwz303.Locate('rkey',rkey303,[]);
      strgrid1.Enabled:=true;
      edit2.Text:=form_episearch.Aqwz303DELIVER_NUMBER.Value;
      self.epi_ptr:=form_episearch.Aqwz303rkey.Value;
      Self.dept_ptr:=Form_episearch.Aqwz303dept_ptr.Value;
      edit3.Text:=form_episearch.Aqwz303SUPPLIER_NAME.Value;
      edit4.Text:=form_episearch.Aqwz303DEPT_NAME.Value;
      self.supp_ptr:=form_episearch.aqwz303supp_ptr.value;
      strgrid1.RowCount:=form_episearch.Aqwz304.RecordCount+1;
      form_episearch.Aqwz304.First;
      for i:=1 to form_episearch.Aqwz304.RecordCount do
      begin
        strgrid1.Cells[0,i]:=form_episearch.Aqwz304MANU_PART_NUMBER.Value;
        strgrid1.Cells[1,i]:=form_episearch.Aqwz304MANU_PART_DESC.Value;
        strgrid1.Cells[2,i]:=form_episearch.Aqwz304STANDARD.Value;
        strgrid1.Cells[3,i]:=form_episearch.Aqwz304UNIT_NAME.Value;
        strgrid1.Cells[4,i]:=form_episearch.Aqwz304rece_quantity.AsString;
        strgrid1.Cells[5,i]:=Form_episearch.Aqwz304rework_qry.AsString;
        strgrid1.Cells[6,i]:='0';
        strgrid1.Cells[8,i]:=form_episearch.Aqwz304rkey.AsString;
        StrGrid1.Cells[9,i]:=Form_episearch.Aqwz304rkey25.AsString;
        form_episearch.Aqwz304.Next;
      end;
    end
    else
      strgrid1.Enabled:=false;
    form_episearch.Free;
  end
  else
  begin
    with dm.tmp do
    begin
      Close;
      SQL.Text:='UPDATE WZDATA304 '+
                'SET rework_qry = wzdata307sum.rework_qry_sum '+
                'FROM WZDATA304 INNER JOIN '+
                '     WZDATA301 ON WZDATA304.EPILIST_PTR = WZDATA301.RKEY INNER JOIN '+
                '      (SELECT received_ptr, CUSTPART_PTR, SUM(rework_qry - received_qty) AS rework_qry_sum '+
                '       FROM WZDATA307 '+
                '       GROUP BY received_ptr, CUSTPART_PTR) AS wzdata307sum ON WZDATA301.CUSTPART_PTR = wzdata307sum.CUSTPART_PTR AND '+
                '     WZDATA304.RKEY = wzdata307sum.received_ptr '+
                'WHERE WZDATA304.DELIVER_PTR = '+ dm.Aqwz306RKEY303.AsString;
      ExecSQL;
    end;
    edit1.Text:=dm.Aqwz306rejected_number.Value;
    edit2.Text:=dm.Aqwz306epiboly_number.Value;
    edit5.Text:=dm.Aqwz306EMPLOYEE_NAME.Value;
    DateTimePicker1.Date:=dm.Aqwz306return_date.Value;
    edit3.Text:=dm.Aqwz306SUPPLIER_NAME.Value;
    edit4.Text:=dm.Aqwz306DEPT_NAME.Value;
    memo1.Text:=dm.Aqwz306REMARK.Value;
    dm.Aq304.Open;
    strgrid1.RowCount:=dm.Aq304.RecordCount+1;
    for i:=1 to dm.Aq304.RecordCount do
    begin
      strgrid1.Cells[0,i]:=dm.Aq304MANU_PART_NUMBER.Value;
      strgrid1.Cells[1,i]:=dm.Aq304MANU_PART_DESC.Value;
      strgrid1.Cells[2,i]:=dm.Aq304STANDARD.Value;
      strgrid1.Cells[3,i]:=dm.Aq304UNIT_NAME.Value;
      if aded_flag = 4 then
        StrGrid1.Cells[4,i]:=dm.Aq304received_qty.AsString
      else
        strgrid1.Cells[4,i]:=dm.Aq304rece_quantity.AsString;
      if Trim(StrGrid1.Cells[4,i])='' then StrGrid1.Cells[4,i]:='0';
      if aded_flag =4 then
        StrGrid1.Cells[5,i]:=dm.Aq304rework_qry_307.AsString
      else
        strgrid1.Cells[5,i]:=dm.Aq304rework_qry_304.AsString;
      if Trim(StrGrid1.Cells[5,i])='' then StrGrid1.Cells[5,i]:='0';
      if aded_flag =4 then
        StrGrid1.Cells[6,i]:='0'
      else
        strgrid1.Cells[6,i]:=dm.Aq304rework_qry_307.AsString;
      if Trim(StrGrid1.Cells[6,i])='' then StrGrid1.Cells[6,i]:='0';
      strgrid1.Cells[7,i]:=dm.Aq304particulars_REMARK.Value;
      strgrid1.Cells[8,i]:=dm.Aq304received_ptr.AsString;
      StrGrid1.Cells[9,i]:=dm.Aq304CUSTPART_PTR.AsString;
      if aded_flag =2 then
        StrGrid1.Cells[10,i]:=dm.Aq304rework_qry_307.AsString;
      dm.Aq304.Next;
    end;
    dm.Aq304.Close;
  end;
  if StrGrid1.Enabled then
  begin
    if aded_flag =2 then
    begin
      for  i := 1 to StrGrid1.RowCount -1  do
      begin
        if StrGrid1.Cells[6,i]<>'0' then
        begin
          StrGrid1.Row:=i;
          Break;
        end;
      end;
    end;
    if aded_flag = 4 then
    begin
      for  i := 1 to StrGrid1.RowCount -1  do
      begin
        if StrGrid1.Cells[5,i]<>'0' then
        begin
          StrGrid1.Row:=i;
          Break;
        end;
      end;
    end;    
    StrGrid1.SetFocus;
  end;
end;

function TForm2.received_over(rkey300:string): boolean;
begin
  with dm.ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from wzdata301');
    sql.Add('where QUANTITY<>RECEVIED_QTY+RETURN_QTY+reject_QTY');
    sql.Add('and EPIBOLY_PTR='+rkey300);
    open;
  end;

  if dm.ADOQuery2.IsEmpty then
    received_over:=true
  else
    received_over:=false;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:word;
 SeedValueStr:string;
begin
  if  SaveCheckPass() then
  begin
    if self.aded_flag=1 then //新增
    begin
      dm.ADOConnection1.BeginTrans;
      try
        dm.ADOwz306.Close;
        dm.ADOwz306.Parameters[0].Value:=null;
        dm.ADOwz306.Open;
        dm.ADOwz306.Append;
        dm.ADOwz306rejected_number.Value:=edit1.Text;
        dm.ADOwz306DELIVER_PTR.Value:=self.epi_ptr;
        dm.ADOwz306EMPL_PTR.Value:=Form1.empl_ptr;
        dm.ADOwz306return_date.Value:=self.DateTimePicker1.Date;
        dm.tmp.close;
        dm.tmp.SQL.Text:='select getdate()' ;
        dm.tmp.Open;
        dm.ADOwz306ENT_DATE.Value:=dm.tmp.Fields[0].Value;
        dm.tmp.close;
        dm.ADOwz306REMARK.Value:=memo1.Text;
        dm.ADOwz306STATUS.Value:=1;
        dm.ADOwz306EMPL_PTR.Value:=form1.empl_ptr;
        dm.ADOwz306supp_ptr.Value:=self.supp_ptr;
        dm.ADOwz306DEPT_PTR.Value:=Self.dept_ptr;
        dm.ADOwz306.Post;
        dm.ADOwz307.Close;
        dm.ADOwz307.Parameters[0].Value:=dm.ADOwz306rkey.Value;
        dm.ADOwz307.Open;
        for i:=1 to strgrid1.RowCount-1 do
        if(strtoint(strgrid1.Cells[6,i])>0) then
        begin
          dm.ADOwz307.Append;
          dm.ADOwz307rejected_ptr.Value:=dm.ADOwz306rkey.Value;
          dm.ADOwz307received_ptr.Value:=StrToInt(StrGrid1.Cells[8,i]);
          dm.ADOwz307CUSTPART_PTR.Value:=StrToInt(StrGrid1.Cells[9,i]);
          dm.ADOwz307UNIT_NAME.Value:=strgrid1.Cells[3,i];
          dm.ADOwz307STANDARD.Value:=strgrid1.Cells[2,i];
          dm.ADOwz307rework_qry.Value:=strtoint(strgrid1.Cells[6,i]);
          dm.ADOwz307particulars_REMARK.Value:=strgrid1.Cells[7,i];
          dm.ADOwz307.Post;
        end;

        with dm.tmp do
        begin
          Close;
          SQL.Text:='UPDATE WZDATA304 '+
                    'SET rework_qry = wzdata307sum.rework_qry_sum '+
                    'FROM WZDATA304 INNER JOIN '+
                    '     WZDATA301 ON WZDATA304.EPILIST_PTR = WZDATA301.RKEY INNER JOIN '+
                    '      (SELECT received_ptr, CUSTPART_PTR, SUM(rework_qry - received_qty) AS rework_qry_sum '+
                    '       FROM WZDATA307 '+
                    '       GROUP BY received_ptr, CUSTPART_PTR) AS wzdata307sum ON WZDATA301.CUSTPART_PTR = wzdata307sum.CUSTPART_PTR AND '+
                    '     WZDATA304.RKEY = wzdata307sum.received_ptr '+
                    'WHERE WZDATA304.DELIVER_PTR = '+ dm.ADOwz306DELIVER_PTR.AsString;
          ExecSQL;
        end;

        with dm.tmp do
        begin
          Close;
          SQL.Text:='UPDATE WZDATA306 '+
                    'SET return_qty =WZDATA307SUM.rework_qry_sum '+
                    'FROM WZDATA306 INNER JOIN '+
                    '     (SELECT rejected_ptr, SUM(rework_qry) AS rework_qry_sum '+
                    '      FROM WZDATA307 '+
                    '      GROUP BY rejected_ptr) AS WZDATA307SUM ON WZDATA306.rkey = WZDATA307SUM.rejected_ptr '+
                    'WHERE WZDATA306.rkey = '+ dm.ADOwz306rkey.AsString;
          ExecSQL;
        end;

        with dm.tmp do
        begin
          Close;
          SQL.Text:='SELECT SEED_VALUE '+
                    'FROM Data0004 '+
                    'WHERE table_name = ''WZDATA306''';
          Open;
          SeedValueStr:=dm.tmp.Fields[0].AsString;
          Self.update_04(trim(SeedValueStr));
        end;

        dm.ADOConnection1.CommitTrans;

        self.ModalResult:=mrok;
      except
        on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
          edit1.SetFocus;
        end;
      end;
      Exit;
    end;
    if aded_flag < 4 then        //编辑、检查
    begin
      dm.ADOConnection1.BeginTrans;
      try
        dm.ADOwz306.Close;
        dm.ADOwz306.Parameters[0].Value:=dm.Aqwz306RKEY.Value;
        dm.ADOwz306.Open;
        dm.ADOwz306.Edit;
        dm.ADOwz306EMPL_PTR.Value:=Form1.empl_ptr;
        dm.ADOwz306return_date.Value:=self.DateTimePicker1.Date;
        dm.tmp.close;
        dm.tmp.SQL.Text:='select getdate()' ;
        dm.tmp.Open;
        dm.ADOwz306ENT_DATE.Value:=dm.tmp.Fields[0].Value;
        dm.ADOwz306REMARK.Value:=memo1.Text;
        dm.ADOwz306STATUS.Value:=1;
        dm.ADOwz306.Post;

        with dm.ADOQuery2 do
        begin
          close;
          sql.Clear;
          sql.Add('delete from wzdata307');
          sql.Add('where WZDATA307.rejected_ptr='+dm.Adowz306RKEY.AsString);
          execsql;
        end;

        dm.ADOwz307.Close;
        dm.ADOwz307.Parameters[0].Value:=dm.ADOwz306rkey.Value;
        dm.ADOwz307.Open;
        for i:=1 to strgrid1.RowCount-1 do
        if (strtoint(strgrid1.Cells[6,i])>0) then
        begin
          dm.ADOwz307.Append;
          dm.ADOwz307rejected_ptr.Value:=dm.ADOwz306rkey.Value;
          dm.ADOwz307received_ptr.Value:=StrToInt(StrGrid1.Cells[8,i]);
          dm.ADOwz307CUSTPART_PTR.Value:=StrToInt(StrGrid1.Cells[9,i]);
          dm.ADOwz307UNIT_NAME.Value:=strgrid1.Cells[3,i];
          dm.ADOwz307STANDARD.Value:=strgrid1.Cells[2,i];
          dm.ADOwz307rework_qry.Value:=strtoint(strgrid1.Cells[6,i]);
          dm.ADOwz307particulars_REMARK.Value:=strgrid1.Cells[7,i];
          dm.ADOwz307.Post;
        end;

        with dm.tmp do
        begin
          Close;
          SQL.Text:='UPDATE WZDATA306 '+
                    'SET return_qty =WZDATA307SUM.rework_qry_sum '+
                    'FROM WZDATA306 INNER JOIN '+
                    '     (SELECT rejected_ptr, SUM(rework_qry) AS rework_qry_sum '+
                    '      FROM WZDATA307 '+
                    '      GROUP BY rejected_ptr) AS WZDATA307SUM ON WZDATA306.rkey = WZDATA307SUM.rejected_ptr '+
                    'WHERE WZDATA306.rkey = '+ dm.Aqwz306rkey.AsString;
          ExecSQL;
        end;

        with dm.tmp do
        begin
          Close;
          SQL.Text:='UPDATE WZDATA304 '+
                    'SET rework_qry = wzdata307sum.rework_qry_sum '+
                    'FROM WZDATA304 INNER JOIN '+
                    '     WZDATA301 ON WZDATA304.EPILIST_PTR = WZDATA301.RKEY INNER JOIN '+
                    '      (SELECT received_ptr, CUSTPART_PTR, SUM(rework_qry - received_qty) AS rework_qry_sum '+
                    '       FROM WZDATA307 '+
                    '       GROUP BY received_ptr, CUSTPART_PTR) AS wzdata307sum ON WZDATA301.CUSTPART_PTR = wzdata307sum.CUSTPART_PTR AND '+
                    '     WZDATA304.RKEY = wzdata307sum.received_ptr '+
                    'WHERE WZDATA304.DELIVER_PTR = '+ dm.Aqwz306RKEY303.AsString;
          ExecSQL;
        end;

        dm.ADOConnection1.CommitTrans;
        self.ModalResult:=mrok;
      except
        dm.ADOConnection1.RollbackTrans;
        showmessage('数据保存遇到错误请速与管理员联系!');
        edit1.SetFocus;
      end;
      Exit;
    end;
    if aded_flag = 4 then        //返工收货
    begin
      dm.ADOConnection1.BeginTrans;
      try
        dm.ADOwz307.Close;
        dm.ADOwz307.Parameters[0].Value:=dm.aqwz306rkey.Value;
        dm.ADOwz307.Open;
        for i:=1 to strgrid1.RowCount-1 do
        begin
          if Trim(StrGrid1.Cells[6,i])='' then StrGrid1.Cells[6,i]:='0';
          if (strtoint(strgrid1.Cells[6,i])>0) then
          begin
            dm.ADOwz307.First;
            while  not dm.ADOwz307.Eof do
            begin
              if (dm.ADOwz307received_ptr.AsString=StrGrid1.Cells[8,i])
                 and (dm.ADOwz307CUSTPART_PTR.AsString=StrGrid1.Cells[9,i]) then
              begin
                dm.ADOwz307.Edit;
                dm.ADOwz307received_qty.Value:=dm.ADOwz307received_qty.Value+strtoint(strgrid1.Cells[6,i]);
                dm.ADOwz307.Post;
              end;
              dm.ADOwz307.Next;
            end;
          end;
        end;

        with dm.tmp do
        begin
          Close;
          SQL.Text:='UPDATE WZDATA304 '+
                    'SET rework_qry = wzdata307sum.rework_qry_sum '+
                    'FROM WZDATA304 INNER JOIN '+
                    '     WZDATA301 ON WZDATA304.EPILIST_PTR = WZDATA301.RKEY INNER JOIN '+
                    '      (SELECT received_ptr, CUSTPART_PTR, SUM(rework_qry - received_qty) AS rework_qry_sum '+
                    '       FROM WZDATA307 '+
                    '       GROUP BY received_ptr, CUSTPART_PTR) AS wzdata307sum ON WZDATA301.CUSTPART_PTR = wzdata307sum.CUSTPART_PTR AND '+
                    '     WZDATA304.RKEY = wzdata307sum.received_ptr '+
                    'WHERE WZDATA304.DELIVER_PTR = '+ dm.Aqwz306RKEY303.AsString;
          ExecSQL;
        end;

        with dm.tmp do
        begin
          Close;
          SQL.Text:='SELECT rejected_ptr, rework_qry - received_qty AS left_rework_qty '+
                    'FROM dbo.WZDATA307 '+
                    'WHERE (rework_qry <> received_qty) AND (rejected_ptr = '+ dm.Aqwz306rkey.AsString+')';
          Open;
        end;

        if dm.tmp.IsEmpty then
        with dm.tmp do
        begin
          Close;
          SQL.Text:='UPDATE WZDATA306 '+
                    'SET STATUS = 4'+
                    'WHERE rkey = '+dm.Aqwz306rkey.AsString;
          ExecSQL;
        end;

        dm.ADOConnection1.CommitTrans;
        self.ModalResult:=mrok;
      except
        dm.ADOConnection1.RollbackTrans;
        showmessage('数据保存遇到错误请速与管理员联系!');
        edit1.SetFocus;
      end;
    end
  end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
 i:word;
begin
  form_episearch:=tform_episearch.Create(application);
  if (form_episearch.ShowModal=mrok) and
     (epi_ptr<>form_episearch.Aqwz303rkey.Value) then
  begin
    strgrid1.Enabled:=true;
    edit2.Text := form_episearch.Aqwz303epiboly_number.Value;
    self.epi_ptr:=form_episearch.Aqwz303rkey.Value;
    edit3.Text:=form_episearch.Aqwz303SUPPLIER_NAME.Value;
    edit4.Text:=form_episearch.Aqwz303DEPT_NAME.Value;
    self.supp_ptr:=form_episearch.aqwz303supp_ptr.value;
    self.dept_ptr:=Form_episearch.Aqwz303dept_ptr.Value;
    strgrid1.RowCount:=form_episearch.Aqwz304.RecordCount+1;
    form_episearch.Aqwz304.First;
    for i:=1 to form_episearch.Aqwz304.RecordCount do
    begin
      strgrid1.Cells[0,i]:=form_episearch.Aqwz304MANU_PART_NUMBER.Value;
      strgrid1.Cells[1,i]:=form_episearch.Aqwz304MANU_PART_DESC.Value;
      strgrid1.Cells[2,i]:=form_episearch.Aqwz304STANDARD.Value;
      strgrid1.Cells[3,i]:=form_episearch.Aqwz304UNIT_NAME.Value;
      strgrid1.Cells[4,i]:=form_episearch.Aqwz304rece_quantity.AsString;
      strgrid1.Cells[5,i]:=Form_episearch.Aqwz304rework_qry.AsString;
      strgrid1.Cells[6,i]:='0';
      strgrid1.Cells[8,i]:=form_episearch.Aqwz304rkey.AsString;
      StrGrid1.Cells[9,i]:=Form_episearch.Aqwz304CUSTPART_PTR.AsString;
      form_episearch.Aqwz304.Next;
    end;
  end;
  form_episearch.Free;
end;

procedure TForm2.StrGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (strgrid1.Col=6) then
  if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
    abort;
end;

procedure TForm2.StrGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (StrGrid1.col > 7) then StrGrid1.Col:=7;
  try
    if (aded_flag = 1) and (strgrid1.Col=6) then
    begin
      if  strgrid1.Cells[6,strgrid1.Row]='' then strgrid1.Cells[6,strgrid1.Row]:='0';
      if  strtoint(strgrid1.Cells[6,strgrid1.Row])>
          strtoint(strgrid1.Cells[4,strgrid1.Row])-
          strtoint(strgrid1.Cells[5,strgrid1.Row]) then
        strgrid1.Cells[6,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[4,strgrid1.Row])-
                                                 strtoint(strgrid1.Cells[5,strgrid1.Row])
                                                );
      Exit;
    end;

    if (aded_flag = 2) and (strgrid1.Col=6) then
    begin
      if  strgrid1.Cells[6,strgrid1.Row]='' then strgrid1.Cells[6,strgrid1.Row]:='0';
      if  strtoint(strgrid1.Cells[6,strgrid1.Row])>
         (strtoint(strgrid1.Cells[4,strgrid1.Row])-
          strtoint(strgrid1.Cells[5,strgrid1.Row])+
          strtoint(strgrid1.Cells[10,strgrid1.Row])) then
        strgrid1.Cells[6,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[4,strgrid1.Row])-
                                                 strtoint(strgrid1.Cells[5,strgrid1.Row])+
                                                 strtoint(strgrid1.Cells[10,strgrid1.Row])
                                                );
      Exit;
    end;

    if (aded_flag = 4) and (strgrid1.Col=6) then
    begin
      if  strgrid1.Cells[6,strgrid1.Row]='' then strgrid1.Cells[6,strgrid1.Row]:='0';
      if  strtoint(strgrid1.Cells[6,strgrid1.Row])>
          strtoint(strgrid1.Cells[5,strgrid1.Row])-
          strtoint(strgrid1.Cells[4,strgrid1.Row]) then
        strgrid1.Cells[6,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[5,strgrid1.Row])-
                                                 strtoint(strgrid1.Cells[4,strgrid1.Row])
                                                );
      Exit;
    end;
  except
    StrGrid1.Cells[6,StrGrid1.Row]:='';
    ShowMessage('输入错误，请重新输入！');
  end;
end;

function TForm2.location_over: boolean;
var
 i:word;
begin
  location_over:=false;
  for i:=1 to strgrid1.RowCount-1 do
    if (strtoint(strgrid1.Cells[6,i])>0) then
    begin                    //必需有一个入仓数量
      break;
    end
    else
      if (i=strgrid1.RowCount-1) then
        location_over:=true;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
  if trim(edit1.Text)='' then
  begin
    showmessage('返工单号不允许为空!');
    edit1.SetFocus;
    exit;
  end;

  if trim(edit2.Text)='' then
  begin
    showmessage('请选择一个收货单号!');
    bitbtn2.SetFocus;
    exit;
  end;

  if self.location_over then
  begin
    messagedlg('至少需要一项返工记录!',mtconfirmation,[mbok],0);
    strgrid1.SetFocus;
    strgrid1.Col:=6;
    exit;
  end;
end;

procedure TForm2.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
  dm.aq04.Close;
  dm.aq04.Open;
  if dm.aq04SEED_FLAG.Value<>1 then
  begin
    v_length := length(v_seed);
    for i := v_length downto 1 do
    if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
    begin
      v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
      new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
      dm.aq04.Edit;                                          //使前缀不变后缀加1
      dm.aq04SEED_VALUE.Value := new_seed;
      dm.aq04.Post;
      break;
    end
    else
    if i=1 then                             //如果第一位仍然是数字
    begin
       v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
       new_seed := copy(v_last,2,v_length);
       dm.aq04.Edit;
       dm.aq04SEED_VALUE.Value := new_seed;
       dm.aq04.Post;
    end;
  end;
end;

function TForm2.Power(x, y: extended): extended;
begin
  result := exp(y*ln(x));
end;

function TForm2.SaveCheckPass: Boolean;
var
  i,j:Integer;
begin
  Result := True;

  if aded_flag = 1 then
  with dm.tmp do
  begin
    Close;
    SQL.Text:='SELECT SEED_VALUE '+
              'FROM Data0004 '+
              'WHERE table_name = ''WZDATA306''';
    Open;
    if Trim(dm.tmp.Fields[0].AsString)<>Trim(Edit1.Text) then
    begin
      Edit1.Text:=dm.tmp.Fields[0].AsString;
      ShowMessage('可能存在同时多人操作，返工单号:'+edit1.Text+'已被使用！'+#13+
                  '返工单号变更为：'+edit1.Text);
      Result :=False;
      Exit;
    end;
  end;

  if aded_flag = 2 then
  with dm.tmp do
  begin
    Close;
    SQL.Text:='SELECT STATUS '+
              'FROM dbo.WZDATA306 '+
              'WHERE rkey = '+dm.Aqwz306rkey.AsString;
    Open;
    if dm.tmp.Fields[0].Value <> dm.Aqwz306STATUS.Value then
    begin
      ShowMessage('可能存在同时多人操作，返工单状态发生变化!');
      Result :=False;
      Self.ModalResult :=mrCancel;
      Exit;
    end;
  end;

  for i:=1 to StrGrid1.RowCount -1 do
  begin
    if StrGrid1.Cells[8,i]<>'' then Break;
  end;

  j:=i;

  with dm.tmp do
  begin
    Close;
    SQL.Text:='SELECT WZDATA306.STATUS, WZDATA304.rework_qry, WZDATA307.received_ptr, '+
              '       WZDATA307.rejected_ptr, WZDATA307.received_qty, WZDATA304.rece_quantity, '+
              '       WZDATA307.rework_qry as rework_qry_307 '+
              'FROM WZDATA306 INNER JOIN '+
              '     WZDATA307 ON WZDATA306.rkey = WZDATA307.rejected_ptr INNER JOIN '+
              '     WZDATA304 ON WZDATA307.received_ptr = WZDATA304.RKEY ';
    if aded_flag =1 then
      SQL.Text:=SQL.Text+'WHERE WZDATA307.rejected_ptr in (SELECT DISTINCT rejected_ptr '+
                         '                                 FROM WZDATA307 '+
                         '                                 WHERE received_ptr = '+strgrid1.Cells[8,j]+')'
    else
      SQL.Text:=SQL.Text+'WHERE WZDATA307.rejected_ptr = '+dm.Aqwz306rkey.AsString;
    Open;

    if (aded_flag > 1) and dm.tmp.IsEmpty then
    begin
      ShowMessage('由于多人操作，可能数据已被其他用户删除！');
      Result :=False;
      Self.ModalResult :=mrCancel;
      Exit;
    end;
  end;

  if aded_flag < 4 then
  begin
    dm.tmp.First;
    for i := 1 to StrGrid1.RowCount -1  do
    begin
      if (dm.tmp.Fields[2].AsString = StrGrid1.Cells[8,i]) and
         (Trim(StrGrid1.Cells[8,i])<>'') then
        if (dm.tmp.Fields[5].AsString <> StrGrid1.Cells[4,i]) or
           (dm.tmp.Fields[1].AsString <> StrGrid1.Cells[5,i]) then
        begin
          ShowMessage('数据发生变化，可能存在多人同时操作造成！');
          Result :=False;
          Self.ModalResult :=mrCancel;
          Exit;
          StrGrid1.Cells[4,i]:=dm.tmp.Fields[5].AsString;
          StrGrid1.Cells[5,i]:=dm.tmp.Fields[1].AsString;
          if aded_flag=2 then
            begin
              StrGrid1.Cells[10,i]:=dm.tmp.Fields[6].AsString;
              if  strtoint(strgrid1.Cells[6,i])>
                 (strtoint(strgrid1.Cells[4,i])-
                  strtoint(strgrid1.Cells[5,i])+
                  strtoint(strgrid1.Cells[10,i])) then
                strgrid1.Cells[6,i]:=inttostr(strtoint(strgrid1.Cells[4,i])-
                                              strtoint(strgrid1.Cells[5,i])+
                                              strtoint(strgrid1.Cells[10,i])
                                            );
            end
          else
            if StrToInt(StrGrid1.Cells[6,i])>(strtoint(StrGrid1.Cells[4,i])-strtoint(StrGrid1.Cells[5,i])) then
              StrGrid1.Cells[6,i]:=IntToStr(strtoint(StrGrid1.Cells[4,i])-strtoint(StrGrid1.Cells[5,i]));
        end;
      dm.tmp.Next;
    end;
  end;

  if aded_flag = 4 then
  begin
    dm.tmp.First;
    for i := 1 to StrGrid1.RowCount -1  do
    begin
      if (dm.tmp.Fields[2].AsString = StrGrid1.Cells[8,i]) and
         (Trim(StrGrid1.Cells[8,i])<>'') then
        if (dm.tmp.Fields[4].AsString <> StrGrid1.Cells[4,i]) or
           (dm.tmp.Fields[6].AsString <> StrGrid1.Cells[5,i]) then
        begin
          ShowMessage('数据发生变化，可能存在多人同时操作造成！');
          Result :=False;
          Self.ModalResult :=mrCancel;
          Exit;
          StrGrid1.Cells[4,i]:=dm.tmp.Fields[4].AsString;
          StrGrid1.Cells[5,i]:=dm.tmp.Fields[6].AsString;
          if StrToInt(StrGrid1.Cells[6,i])>(strtoint(StrGrid1.Cells[5,i])-strtoint(StrGrid1.Cells[4,i])) then
            StrGrid1.Cells[6,i]:=IntToStr(strtoint(StrGrid1.Cells[5,i])-strtoint(StrGrid1.Cells[4,i]));
        end;
      dm.tmp.Next;
    end;
  end;
end;

procedure TForm2.StrGrid1Exit(Sender: TObject);
var
  i:Integer;
begin
  for i:=1 to StrGrid1.RowCount-1 do
  begin
    try
      if (aded_flag = 1) then
      begin
        if  strgrid1.Cells[6,i]='' then strgrid1.Cells[6,i]:='0';
        if  strtoint(strgrid1.Cells[6,i])>
            strtoint(strgrid1.Cells[4,i])-
            strtoint(strgrid1.Cells[5,i]) then
          strgrid1.Cells[6,i]:=inttostr(strtoint(strgrid1.Cells[4,i])-
                                                   strtoint(strgrid1.Cells[5,i])
                                                  );
      end;

      if (aded_flag = 2) then
      begin
        if  strgrid1.Cells[6,i]='' then strgrid1.Cells[6,i]:='0';
        if  strtoint(strgrid1.Cells[6,i])>
           (strtoint(strgrid1.Cells[4,i])-
            strtoint(strgrid1.Cells[5,i])+
            strtoint(strgrid1.Cells[10,i])) then
          strgrid1.Cells[6,i]:=inttostr(strtoint(strgrid1.Cells[4,i])-
                                        strtoint(strgrid1.Cells[5,i])+
                                        strtoint(strgrid1.Cells[10,i])
                                       );
      end;

      if (aded_flag = 4) then
      begin
        if  strgrid1.Cells[6,i]='' then strgrid1.Cells[6,i]:='0';
        if  strtoint(strgrid1.Cells[6,i])>
            strtoint(strgrid1.Cells[5,i])-
            strtoint(strgrid1.Cells[4,i]) then
          strgrid1.Cells[6,i]:=inttostr(strtoint(strgrid1.Cells[5,i])-
                                        strtoint(strgrid1.Cells[4,i])
                                       );
      end;
    except

    end;

  end;
end;

procedure TForm2.StrGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  try
    if (StrGrid1.col > 7) then StrGrid1.Col:=7;
    if (aded_flag = 1) and (strgrid1.Col=6) then
    begin
      if  strgrid1.Cells[6,strgrid1.Row]='' then strgrid1.Cells[6,strgrid1.Row]:='0';
      if  strtoint(strgrid1.Cells[6,strgrid1.Row])>
          strtoint(strgrid1.Cells[4,strgrid1.Row])-
          strtoint(strgrid1.Cells[5,strgrid1.Row]) then
      begin
        strgrid1.Cells[6,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[4,strgrid1.Row])-
                                                 strtoint(strgrid1.Cells[5,strgrid1.Row])
                                                );
        ShowMessage('输入错误，请重新输入！');
        CanSelect :=False;
      end;
      Exit;
    end;

    if (aded_flag = 2) and (strgrid1.Col=6) then
    begin
      if  strgrid1.Cells[6,strgrid1.Row]='' then strgrid1.Cells[6,strgrid1.Row]:='0';
      if  strtoint(strgrid1.Cells[6,strgrid1.Row])>
         (strtoint(strgrid1.Cells[4,strgrid1.Row])-
          strtoint(strgrid1.Cells[5,strgrid1.Row])+
          strtoint(strgrid1.Cells[10,strgrid1.Row])) then
      begin
        strgrid1.Cells[6,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[4,strgrid1.Row])-
                                                 strtoint(strgrid1.Cells[5,strgrid1.Row])+
                                                 strtoint(strgrid1.Cells[10,strgrid1.Row])
                                                );
        ShowMessage('输入错误，请重新输入！');
        CanSelect :=False;
      end;
      Exit;
    end;

    if (aded_flag = 4) and (strgrid1.Col=6) then
    begin
      if  strgrid1.Cells[6,strgrid1.Row]='' then strgrid1.Cells[6,strgrid1.Row]:='0';
      if  strtoint(strgrid1.Cells[6,strgrid1.Row])>
          strtoint(strgrid1.Cells[5,strgrid1.Row])-
          strtoint(strgrid1.Cells[4,strgrid1.Row]) then
      begin
        strgrid1.Cells[6,strgrid1.Row]:=inttostr(strtoint(strgrid1.Cells[5,strgrid1.Row])-
                                                 strtoint(strgrid1.Cells[4,strgrid1.Row])
                                                );
        ShowMessage('输入错误，请重新输入！');
        CanSelect :=False;
      end;
      Exit;
    end;
  except
    ShowMessage('输入错误，请重新输入！');
    CanSelect :=False;
  end;

end;

end.
