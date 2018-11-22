unit UEP200_Submit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,common, DB, ADODB;

type
  TSubmit_Form = class(TForm)
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { Private declarations }
  protected
    procedure WndProc(var Message: TMessage); override;

  public
    { Public declarations }
   
  end;

var
  Submit_Form: TSubmit_Form;
  anme :string;
implementation

uses UEP200;

//uses UEP200;
{$R *.dfm}

procedure TSubmit_Form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then
abort;
end;

procedure TSubmit_Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
      key:=#0;
      perform(wm_nextdlgctl,0,0);{移动到下一个控件}
  end;
end;

procedure TSubmit_Form.BitBtn3Click(Sender: TObject);
var
  icount1,icount2:Integer;
begin
    //查询投产半成品
  icount1:=0;
  icount2:=0;
  with TADOQuery.Create(nil) do
  begin
    Connection:=Main_Form.ADOConnection1;
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT  distinct dbo.Data0008.PROD_CODE '+
               ' FROM dbo.Data0008 INNER JOIN '+
               ' dbo.DATA0140 ON dbo.Data0008.RKEY = dbo.DATA0140.part_ptr INNER JOIN '+
               ' dbo.data0492 ON dbo.Data0008.RKEY = dbo.data0492.BOM_PTR INNER JOIN '+
               ' dbo.DATA0148 ON dbo.DATA0140.rkey = dbo.DATA0148.PART_PTR INNER JOIN '+
               ' dbo.Data0008 AS Data0008_1 ON dbo.DATA0148.INVENT_PTR = Data0008_1.RKEY  WHERE'+
               ' (dbo.DATA0148.Invent_or <> 0)  AND (dbo.data0492.CUT_NO = '''+anme+''') AND (dbo.DATA0140.status = 1)';
    try
      Open;
      icount1:=RecordCount;
    finally
      Free;
    end;
  end;

  if icount1 >0  then
    begin
        //查询出仓半成品
      with TADOQuery.Create(nil) do
      begin
        Connection:=Main_Form.ADOConnection1;
        Close;
        SQL.Clear;
        SQL.Text :=  'SELECT  distinct  dbo.Data0008.PROD_CODE'+
                     ' FROM  dbo.WZCP0060 INNER JOIN '+
                     ' dbo.data0492 ON dbo.WZCP0060.MO_PTR = dbo.data0492.rkey INNER JOIN '+
                     ' dbo.Data0005 ON dbo.WZCP0060.ent_user_ptr = dbo.Data0005.RKEY INNER JOIN  '+
                     ' dbo.WZCP0063 ON dbo.WZCP0060.rkey = dbo.WZCP0063.so_ptr INNER JOIN '+
                     ' dbo.Data0008 ON dbo.WZCP0063.prod_ptr = dbo.Data0008.RKEY INNER JOIN '+
                     ' dbo.Data0468 ON dbo.data0492.CUT_NO = dbo.Data0468.CUT_NO  '+
                     ' WHERE  (dbo.WZCP0060.type = 3) and (dbo.data0492.cut_no='''+ anme +''' )  and (data0008.ttype = 0) and (dbo.Data0468.STATUS=1) ';
        try
          Open;
          icount2:=RecordCount;
        finally
          Free;
        end;
      end;
      //半成品发放数量超过或等于产品BOM的半成品数量 允许发放
      if icount1<=icount2 then
        begin
          if (strtointdef(edit1.Text,0) = 0) or (strtointdef(edit1.Text,0) < 0) then
            begin
               showmsg('提交入库数量不能小于或等于零,请更改',1);
               edit1.Text := '0';
               edit1.SetFocus ;
               exit;
            end
            else
          if strtointdef(edit1.Text,0) > strtointdef(edit4.Text,0)  then
            begin
                showmsg('提交入库数量不能大于当前在线数量,请更改',1);
                edit1.Text := edit4.Text ;
                edit1.SetFocus ;
                exit;
            end
            else
            modalresult:=mrok;

        end
      else
        ShowMessage('请先处理半成品!');

     end
  else
  begin
    if (strtointdef(edit1.Text,0) = 0) or (strtointdef(edit1.Text,0) < 0) then
      begin
        showmsg('提交入库数量不能小于或等于零,请更改',1);
        edit1.Text := '0';
        edit1.SetFocus ;
        exit;
      end
      else
    if strtointdef(edit1.Text,0) > strtointdef(edit4.Text,0)  then
      begin
        showmsg('提交入库数量不能大于当前在线数量,请更改',1);
        edit1.Text := edit4.Text ;
        edit1.SetFocus ;
        exit;
      end
      else
          modalresult:=mrok;

  end;
end;

procedure TSubmit_Form.BitBtn2Click(Sender: TObject);
begin
  modalresult:=mrCancel;
end;

procedure TSubmit_Form.FormShow(Sender: TObject);
begin
          edit1.SetFocus ;
end;

procedure TSubmit_Form.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit1.Text)='' then  edit1.Text:=edit4.Text;
end;

procedure TSubmit_Form.Edit1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
Handled:=true;
end;

procedure TSubmit_Form.WndProc(var Message: TMessage);
begin
  if Message.Msg = messages.WM_SYSCOMMAND  then
  begin
    if (Message.WParam = windows.SC_MAXIMIZE) then
    begin
      with Self do
      begin
        Top := 0;
        Left:= 0;
        Width := Screen.Width;
        Height := Screen.Height;
      end;
    end;
  end;
  inherited WndProc(Message);
end;

end.
