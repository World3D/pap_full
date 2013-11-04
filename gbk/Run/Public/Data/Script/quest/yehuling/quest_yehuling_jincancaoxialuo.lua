

--�ű���
x207004_g_ScriptId = 207004

--��һ�������ID
x207004_g_MissionIdPre =2

--�����
x207004_g_MissionId = 5

--����Ŀ��npc
x207004_g_Name	="�����" 
x207004_g_Name2	="������" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************


--���񷢷ŵ���Ʒ
--x207004_g_MissionItem = {{id=10400001,num=1}}

--�����Ƕ�̬**************************************************************

--�����ı�����
x207004_g_MissionName="��ϲ�����"
x207004_g_MissionInfo="ֻ�����Ĺ��Ų���ϲݣ����ֲ�ҩ�ǳ�ϡ�档�����������ĵ�������죬��ȥ���������ڽ�ϲݵ����顣"  --��������
x207004_g_MissionTarget="ѯ���������ҵ���ϲݵķ���"		--����Ŀ��
x207004_g_MissionComplete="��������֮ǰ���������Ų��İ���������Ӧ���������Ѿ�׼�����˽��������Ľ�ϲݡ�"					--�������npc˵���Ļ�
--x207004_g_MissionAddItem="�õ������ܱ�"		
--x207004_g_szBackageFull = "����������"
--������
x207004_g_MoneyBonus=200
x207004_g_ItemBonus={}
x207004_g_RadioItemBonus={}
x207004_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
        if x207004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207004_g_MissionId) > 0 then
	
		if (GetName(sceneId,targetId)==x207004_g_Name2) then
                     BeginEvent(sceneId)
                     AddText(sceneId, x207004_g_MissionName)
                     AddText(sceneId,x207004_g_MissionComplete)
                     AddMoneyBonus(sceneId, x207004_g_MoneyBonus)
                     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207004_g_ScriptId, x207004_g_MissionId)
		end
        elseif x207004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207004_g_MissionName, x207004_g_MissionInfo, x207004_g_MissionTarget, x207004_g_ItemBonus, x207004_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207004_g_ScriptId, x207004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207004_g_MissionId) > 0 then
		return 
	end
	--�������鿴����
	if  x207004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207004_g_ScriptId, x207004_g_MissionName)
	end
	
end 



--**********************************

--����������

--**********************************

function x207004_CheckAccept(sceneId, selfId, targetId)

	    if (GetName(sceneId,targetId)==x207004_g_Name) then 
					return 1
	    end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207004_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207004_g_Name) then
                if IsMissionHaveDone(sceneId, selfId, x207004_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x207004_g_MissionId)<= 0 then
                    return 1
                    end
                end
        end
	if (GetName(sceneId,targetId)==x207004_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207004_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************
                                    
--����                              
                                    
--**********************************

function x207004_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207004_g_MissionId, x207004_g_ScriptId, 1, 0, 0)
	
end



--**********************************

--����

--**********************************

function x207004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207004_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207004_CheckSubmit( sceneId, selfId, targetId)
        if IsHaveMission(sceneId, selfId, x200101_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207004_g_MissionId)
		AddExp(sceneId, selfId, x207004_g_ExpBonus)
		AddMoney(sceneId, selfId, x207004_g_MoneyBonus)
		for i, item in x207004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207004_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207004_OnItemChanged(sceneId, selfId, itemdataId)

end

