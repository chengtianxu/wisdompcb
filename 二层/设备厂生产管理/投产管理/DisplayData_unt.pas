unit DisplayData_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB;

type
  TDisplayData_frm = class(TForm)
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure show_DisplayData_frm(ParentForm:TForm;AFormCaption:string;
                  SourceDataSet:TDataSet); StdCall;

var
  DisplayData_frm: TDisplayData_frm;

implementation

{$R *.dfm}

procedure show_DisplayData_frm(ParentForm:TForm;AFormCaption:string;
                  SourceDataSet:TDataSet);
begin
  try
    DisplayData_frm:=TDisplayData_frm.Create(Application);
    with  DisplayData_frm do
    begin
      Font.Size   := ParentForm.Font.Size;
      Font.Charset:= ParentForm.Font.Charset;
      Font.Name   := ParentForm.Font.Name;

      Caption:=AFormCaption;
      DataSource1.DataSet := SourceDataSet   ;
      ShowModal;

    end ;
  finally
    DisplayData_frm.Free;
  end;
end;

end.
