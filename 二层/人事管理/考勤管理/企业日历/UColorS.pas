unit UColorS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TColorS_Form = class(TForm)
    Shape1: TShape;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    ColorBox1: TColorBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    ftag, frkey : Integer;
    procedure initd;
    { Public declarations }
  end;

var
  ColorS_Form: TColorS_Form;

implementation

uses UDM;

{$R *.dfm}

procedure TColorS_Form.initd;
var
  c: LongInt;
  i: Integer;
  QueryTmp : TADOQuery;
begin
  if Ftag=0 then
  begin
    frkey := -1;
    self.Caption:='颜色定义-新增';
    DM.Resttypemsg.Close;
    DM.Resttypemsg.Open;
    DM.Resttypemsg.Append;
  end else
  if  Ftag=1 then
  begin
            self.Caption:='颜色定义-编辑';
            DM.Resttypemsg.Close;
            DM.Resttypemsg.Open;
            DM.Resttypemsg.Locate('rkey',frkey,[]);
            Edit1.Text := DM.Resttypemsg.FieldByName('resttype_name').AsString;
            IdentToColor(DM.Resttypemsg.FieldByName('color').AsString,c);
            Shape1.Brush.Color := c;
            ColorBox1.Selected := c;
            Shape1.Hint := DM.Resttypemsg.FieldByName('color').AsString;
            if DM.Resttypemsg.FieldByName('remark').AsString <> '' then
            Edit2.Text := DM.Resttypemsg.FieldByName('remark').AsString;
            QueryTmp:=TADOQuery.Create(Self);
            QueryTmp.Connection := DM.ADOConnection1;
            QueryTmp.SQL.Clear;
            QueryTmp.sql.text := 'SELECT     rkey, Type FROM  dbo.FactoryCalendar WHERE Type = '+inttostr(frkey)+#13;
            QueryTmp.close;
            QueryTmp.open;
            if not QueryTmp.IsEmpty then
             begin
                 Edit1.Enabled := False;
             end else
              Edit1.Enabled := True;
             QueryTmp.Free;
  end;

    ColorBox1.Items.Delete(0);
    ColorBox1.Items.Delete(8);
    ColorBox1.Items.Delete(13);
   for i := 22 to 100 do
   begin
       ColorBox1.Items.Delete(22);
   end;
   ColorBox1.Items.Delete(18);
   ColorBox1.Items.Delete(17);
   ColorBox1.Items.Delete(17);

end;

procedure TColorS_Form.BitBtn1Click(Sender: TObject);
var
    QueryTmp : TADOQuery;
begin
    if ColorBox1.ItemIndex = -1 then
    begin
        ShowMessage('还没选择颜色，请先选择颜色，谢谢');
        Abort;
    end;

    if Shape1.Brush.Color = clwhite then
    begin
        ShowMessage('白色为背景基色，不可定义为白色，请重新选择，谢谢！');
        Abort;
    end;
    if Shape1.Brush.Color = clblack then
    begin
        ShowMessage('黑色为日期基色，建议不要定义为黑色，请重新选择，谢谢！');
        Abort;
    end;
    if Shape1.Brush.Color = clred then
    begin
        ShowMessage('红色为周六日基色，建议不要定义为红色，请重新选择，谢谢！');
        Abort;
    end;
     QueryTmp:=TADOQuery.Create(Self);
     QueryTmp.Connection := DM.ADOConnection1;
     QueryTmp.SQL.Clear;
     QueryTmp.sql.text := 'SELECT  rkey, resttype_name, color, remark FROM  dbo.Resttypemsg WHERE color = '''+Shape1.Hint+''''+#13;
     if not QueryTmp.IsEmpty then
     begin
              ShowMessage('该颜色已被定义，请选用其它颜色，谢谢！');
              Abort;
     end;
    if Edit1.Text ='' then
    begin
        ShowMessage('名称不能为空，请填入名称，谢谢！');
        Edit1.SetFocus;
        Abort;
    end;

    if Ftag=0 then
    begin
              if Edit1.Text <>'' then
              begin
                  QueryTmp.SQL.Clear;
                  QueryTmp.sql.text := 'SELECT  rkey, resttype_name, color, remark FROM  dbo.Resttypemsg WHERE resttype_name = '''+TRIM(Edit1.Text)+''''+#13;
                  if not QueryTmp.IsEmpty then
                  begin
                        ShowMessage('该名称已定义，请选用其它名称，谢谢！');
                        Abort;
                  end;
              end;
    end;

    if DM.ADOConnection1.Connected then
    begin
         if Ftag=0 then
         begin
           try
                  DM.Resttypemsg.FieldByName('resttype_name').AsString :=  TRIM(Edit1.Text);
                  DM.Resttypemsg.FieldByName('color').AsString :=  Shape1.Hint;
                  if Edit2.Text <> '' then
                  DM.Resttypemsg.FieldByName('remark').AsString :=  Edit2.Text;
                  DM.ADOConnection1.BeginTrans;
                  DM.Resttypemsg.UpdateBatch(arAll);
                  DM.ADOConnection1.CommitTrans;
           except
                              DM.ADOConnection1.RollbackTrans;
                              showmessage('保存数据失败...');
           end;
         end else
         if  Ftag=1 then
         begin
               try
                        DM.Resttypemsg.Edit;
                        DM.Resttypemsg.FieldByName('resttype_name').AsString :=  TRIM(Edit1.Text);
                        DM.Resttypemsg.FieldByName('color').AsString :=  Shape1.Hint;
                        if Edit2.Text <> '' then
                        DM.Resttypemsg.FieldByName('remark').AsString :=  Edit2.Text;
                        DM.ADOConnection1.BeginTrans;
                        DM.Resttypemsg.UpdateBatch(arAll);
                        DM.ADOConnection1.CommitTrans;
               except
                                    DM.ADOConnection1.RollbackTrans;
                                    showmessage('保存数据失败...');
               end;
         end;
    end;
    ModalResult := mrOk; 
end;

procedure TColorS_Form.ColorBox1Change(Sender: TObject);
var
 s : string;
begin
    Shape1.Brush.Color := ColorBox1.Selected;
    if ColorToIdent(ColorBox1.Selected, s) then
    Shape1.Hint := s;
end;

end.
