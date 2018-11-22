unit u_infosend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGridEh, Buttons, ComCtrls;

type
  Tfrm_infosend = class(TForm)
    pnl1: TPanel;
    btn1: TButton;
    Button1: TButton;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    btn3: TButton;
    btn5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    edt1: TEdit;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbl1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    pb1: TProgressBar;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pnl2Resize(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure stringgrid1addrows(employeecode,chinesename,phone,outdutytime : string);
    procedure stringgrid1sendmessage(employeecode,chinesename,phone : string);
    procedure stringgrid1deleterows;
    procedure init;
  public
    operator :integer;
  end;

var
  frm_infosend: Tfrm_infosend;

implementation

uses damo, common, u_infohistory;

{$R *.dfm}
procedure Tfrm_infosend.init;
begin
    dm.ADOTMP.Close;
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text := 'select top 1  SUPLFEDSHIP,SUPLFEDMAT,SUPLFEDMISC from data0192';
    dm.ADOTMP.Open;
    if dm.ADOTMP.Eof then
     begin
      showmessage('未设置短信平台，请与管理员联系');
      exit;
      end
      else
      begin
        label11.Caption :='['+dm.ADOTMP.fieldbyname('SUPLFEDSHIP').AsString+'].';
        label12.Caption := '['+dm.ADOTMP.fieldbyname('SUPLFEDMAT').AsString+'].dbo.';
        label13.Caption := '['+dm.ADOTMP.fieldbyname('SUPLFEDMISC').AsString+']';
      end;
     dm.ADOTMP.Close;
     dm.ADOTMP.SQL.Clear;
     dm.ADOTMP.SQL.Text :='select top 1 * from '+ label11.Caption+  label12.Caption + label13.Caption;
     try
       dm.ADOTMP.Open;
       dm.ADOTMP.Close;
   except
        showmessage('连接短信平台'+label11.Caption+'失败,请与网络管理员联系');
        exit;
     end ;
     
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text := 'select top 1 warehouse_name,convert(nvarchar(20),getdate(),102) as nowdays from data0015';
    dm.ADOTMP.Open;
    edt1.Text := dm.ADOTMP.fieldbyname('warehouse_name').AsString;
    //nowdays
    label5.Caption := dm.ADOTMP.fieldbyname('nowdays').AsString;
    dm.ADOTMP.Close;
    //

    if dm.cds_infosend.Active then dm.cds_infosend.Active := false;
    dm.cds_infosend.Params[0].Value := operator;
    dm.cds_infosend.Params[1].Value := strtoint(common.rkey73);
    dm.cds_infosend.Params[2].Value := dm.program_rkey;
    dm.cds_infosend.Active := true; 
    //初始化网格
    stringgrid1.RowCount := 2;
    stringgrid1.ColCount := 4;
    stringgrid1.Cells[0,0] := '工号';
    stringgrid1.Cells[1,0] := '姓名';
    stringgrid1.Cells[2,0] := '电话';
    stringgrid1.Cells[3,0] := '离职日期';
end;

procedure Tfrm_infosend.stringgrid1sendmessage(employeecode,chinesename,phone : string);
begin
 try
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text :=  'insert into data0014(message,senddate,whosend)'+
       ' select '+quotedstr(employeecode)+',getdate(),'+inttostr(operator)+
       ' insert into '+label11.Caption+  label12.Caption + label13.Caption +
       ' (phonenumber,messagecontent,sendername,companyid) '+
       ' select '+quotedstr(phone)+','
 +quotedstr(chinesename+#13+memo1.Text+#13+edt1.Text+#13+label5.Caption)+','
 +quotedstr('人力资源部')+',9';
 //showmessage(dm.ADOTMP.SQL.Text);
  dm.ADOTMP.ExecSQL;
 except
   showmessage('发送失败');
 end;
end;

procedure Tfrm_infosend.stringgrid1addrows(employeecode,chinesename,phone,outdutytime : string);
var i,j,k :integer;
begin
    if stringgrid1.Cells[0,1]<>'' then stringgrid1.RowCount := stringgrid1.RowCount +1;
    i := stringgrid1.RowCount-1;
    stringgrid1.Cells[0,i] := employeecode;
    stringgrid1.Cells[1,i] := chinesename;
    stringgrid1.Cells[2,i] := phone;
    stringgrid1.Cells[3,i] := outdutytime;

end;

procedure Tfrm_infosend.stringgrid1deleterows;
var i,j,k :integer;
begin
  k := stringgrid1.RowCount-1;
  if stringgrid1.RowCount <= 1 then exit;
  i:=stringgrid1.Row;
  if stringgrid1.cells[0,i]='' then exit;
  dm.cds_infosend.edit;
  dm.cds_infosend.Append;
  dm.cds_infosendselected.value := false;
  dm.cds_infosendemployeecode.Value := stringgrid1.cells[0,i];
  dm.cds_infosendchinesename.Value := stringgrid1.cells[1,i];
  dm.cds_infosendphone.Value := stringgrid1.cells[2,i];
  dm.cds_infosendoutdutytime.Value := stringgrid1.cells[3,i];
  dm.cds_infosend.Post;
  if stringgrid1.RowCount = 2 then
  begin
    stringgrid1.cells[0,i]:='';
    stringgrid1.cells[1,i]:='';
    stringgrid1.cells[2,i]:='';
    stringgrid1.cells[3,i]:='';
  end;
  if stringgrid1.RowCount > 2 then
  begin
  for i:=stringgrid1.Row to    k-1
  do stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
  //清空最后一行
    stringgrid1.cells[0,k]:='';
    stringgrid1.cells[0,k]:='';
    stringgrid1.cells[0,k]:='';
    stringgrid1.cells[0,k]:='';
  //删除最后一行
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
  end;

end;

procedure Tfrm_infosend.FormCreate(Sender: TObject);
begin
    if dm.ADOTMP.Active then dm.ADOTMP.Close;
    dm.ADOTMP.SQL.Clear;
    dm.ADOTMP.SQL.Text :='select rkey from data0073 where USER_FULL_NAME='+
    quotedstr('人力资源部');
    dm.ADOTMP.Open;
    if not dm.ADOTMP.Eof then
    operator := dm.ADOTMP.fieldbyname('rkey').AsInteger
    else
    begin
      showmessage('请通知管理员添加[人力资源部]角色');
      exit;
    end;
    init;
    end;

procedure Tfrm_infosend.pnl2Resize(Sender: TObject);
begin
  pnl6.Width := trunc(pnl2.Width*0.45);
  pnl8.Width := trunc(pnl2.Width*0.45);
end;

procedure Tfrm_infosend.btn1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_infosend.btn3Click(Sender: TObject);
var i,k: integer;
begin
 if dm.cds_infosend.RecordCount=0 then exit;
 k :=   dm.cds_infosend.RecordCount;
   dm.cds_infosend.First;
   while not dm.cds_infosend.Eof do
   begin
          if dm.cds_infosendselected.Value = true
          then
          begin
           stringgrid1addrows
          (dm.cds_infosendemployeecode.Value,dm.cds_infosendchinesename.Value,dm.cds_infosendphone.Value,dm.cds_infosendoutdutytime.Value);
           dm.cds_infosend.Delete;
          end
          else  dm.cds_infosend.Next;
   end;  
end;



procedure Tfrm_infosend.btn5Click(Sender: TObject);
begin
    stringgrid1deleterows;
end;




procedure Tfrm_infosend.BitBtn1Click(Sender: TObject);
begin
 if dm.cds_infosend.RecordCount=0 then exit;
    dm.cds_infosend.First;
       while not dm.cds_infosend.Eof do
        begin
           dm.cds_infosend.Edit;
           dm.cds_infosendselected.Value := true ;
           dm.cds_infosend.Next;
        end;
end;

procedure Tfrm_infosend.BitBtn2Click(Sender: TObject);
var  i,j,k : integer;
begin
  if stringgrid1.Cells[1,0]='' then exit;
  
     dm.ADOTMP.Close;
     dm.ADOTMP.SQL.Clear;
     dm.ADOTMP.SQL.Text :='select top 1 * from '+ label11.Caption+  label12.Caption + label13.Caption;
     try
       dm.ADOTMP.Open;
       dm.ADOTMP.Close;
   except
        showmessage('连接短信平台'+label11.Caption+'失败,请与网络管理员联系');
        exit;
     end ;
   // stringgrid1sendmessage()
    K:=stringgrid1.RowCount -1;
    for i := 1 to k  do
    begin
      if stringgrid1.Cells[0,i]<>''
      then
      begin
        pb1.Position := trunc(i/k)*100;
        stringgrid1sendmessage(stringgrid1.Cells[0,i],stringgrid1.Cells[1,i],stringgrid1.Cells[2,i]);
        application.ProcessMessages;
      end;
    end;
    stringgrid1.RowCount := 2;
    stringgrid1.Cells[0,1] :='';
    stringgrid1.Cells[1,1] :='';
    stringgrid1.Cells[2,1] :='';
    stringgrid1.Cells[3,1] :='';
    showmessage('发送完毕');
    pb1.Position :=0;
    
end;

procedure Tfrm_infosend.Button1Click(Sender: TObject);
begin
  try
    frm_infohistory := Tfrm_infohistory.Create(nil);
    frm_infohistory.ShowModal;
    dm.ADOQuery4.Active := true;

  finally
    frm_infohistory.Free;
    end;

end;

end.
